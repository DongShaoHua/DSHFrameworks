//
//  DSHListViewController.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHListViewController.h"
#import "DSHTableViewCell.h"
#import "DSHCollectionViewCell.h"

NSString * const DSHListDefaultCellId = @"DSH_List_Default_Cell_Id";

@interface DSHListViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *listView;

- (UITableViewCell *)tableCellWith:(__kindof UITableView *)listView forIndexPath:(NSIndexPath *)indePath;

- (UICollectionViewCell *)collectionViewCellWith:(__kindof UICollectionView *)listView forIndexPath:(NSIndexPath *)indePath;

@end

@implementation DSHCellNibInfo

- (instancetype)init {
    self = [super init];
    if (self) {
        _cellId = DSHListDefaultCellId;
        _hasNib = NO;
        _allocCellBlock = nil;
    }
    return self;
}

- (instancetype)initWithCellId:(NSString *)cellId andHasNib:(BOOL)hasNib allocCellBlock:(UITableViewCell *(^)(NSString *cellId))block {
    self = [super init];
    if (self) {
        _cellId = cellId;
        _hasNib = hasNib;
        _allocCellBlock = block;
    }
    return self;
}

- (void)dealloc {
    _cellId = nil;
    _allocCellBlock = nil;
}

+ (instancetype)infoWithCellId:(NSString *)cellId {
    return [self infoWithCellId: cellId andHasNib: NO];
}

+ (instancetype)infoWithCellId:(NSString *)cellId andHasNib:(BOOL)hasNib {
    return [self infoWithCellId: cellId andHasNib: hasNib allocCellBlock: nil];
}

+ (instancetype)infoWithCellId:(NSString *)cellId andHasNib:(BOOL)hasNib allocCellBlock:(UITableViewCell *(^)(NSString *cellId))block {
    return [[DSHCellNibInfo alloc] initWithCellId: cellId andHasNib: hasNib allocCellBlock: block];
}

@end

@implementation DSHListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _data = [NSMutableArray array];
    _page = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_data removeAllObjects];
    _data = nil;
}

#pragma mark ====== 列表信息配置 ======
- (__kindof UIView *)getListView {
    return _listView;
}

- (DSHCellNibInfo *)getCellInfoWith:(UIView *)view forIndexPath:(NSIndexPath *)indexPath {
    return [DSHCellNibInfo new];
}

#pragma mark ========= 列表相关方法 ==========
- (NSInteger)getListDataCount:(UIView *)view forSection:(NSInteger)section {
    return _data.count;
}

- (__kindof UIView *)listCell:(__kindof UIView *)listView forIndexPath:(NSIndexPath *)indePath {
    if (_kind_of_(listView, UITableView)) {
        return [self tableCellWith: listView forIndexPath: indePath];
    } else {
        if (_kind_of_(listView, UICollectionView)) {
            return [self collectionViewCellWith: listView forIndexPath: indePath];
        } else {
            return nil;
        }
    }
}

- (__kindof id)listData:(__kindof UIView *)listView forIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < _data.count) {
        return _data[indexPath.row];
    } else {
        return nil;
    }
}

- (void)configRowDetail:(UIView *)listView cell:(UIView *)cell forIndexPath:(NSIndexPath *)indexPath {
    id data = [self listData: listView forIndexPath: indexPath];
    if (_kind_of_(cell, DSHTableViewCell)) {
        [((DSHTableViewCell *)cell) setCellDetail: data forIndexPath: indexPath];
    } else {
        if (_kind_of_(cell, DSHCollectionViewCell)) {
            [((DSHCollectionViewCell *)cell) setCellDetail: data forIndexPath: indexPath];
        }
    }
}

#pragma mark ======== table delegate =========

- (UITableViewCell *)tableCellWith:(__kindof UITableView *)listView forIndexPath:(NSIndexPath *)indePath {
    UITableViewCell *cell = nil;
    DSHCellNibInfo *cellInfo =  [self getCellInfoWith: listView forIndexPath: indePath];
    if (cellInfo.hasNib) {
        cell = cellInfo.allocCellBlock ? cellInfo.allocCellBlock(cellInfo.cellId) : [listView dequeueReusableCellWithIdentifier: cellInfo.cellId forIndexPath: indePath];
    } else {
        cell = [listView dequeueReusableCellWithIdentifier: cellInfo.cellId];
        if (!cell) {
            cell = cellInfo.allocCellBlock ? cellInfo.allocCellBlock(cellInfo.cellId) : [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellInfo.cellId];
        }
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self getListDataCount: tableView forSection: section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self listCell: tableView forIndexPath: indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self configRowDetail: tableView cell: cell forIndexPath: indexPath];
}

#pragma mark ======== collection delegate =========
- (UICollectionViewCell *)collectionViewCellWith:(__kindof UICollectionView *)listView forIndexPath:(NSIndexPath *)indePath {
    DSHCellNibInfo *cellInfo = [self getCellInfoWith: listView forIndexPath: indePath];
    return [listView dequeueReusableCellWithReuseIdentifier: cellInfo.cellId forIndexPath: indePath];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self getListDataCount: collectionView forSection: section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self listCell: collectionView forIndexPath: indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [self configRowDetail: collectionView cell: cell forIndexPath: indexPath];
}

- (__kindof id)loadListData {
    return nil;
}

#if __has_include(header_file_for_mjrefresh)

#pragma mark ====== 启动下拉和上拉 =======
- (MJRefreshHeader *)mjRefreshHeaderCreator {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget: self refreshingAction: @selector(refreshTriggeer:)];
    header.lastUpdatedTimeLabel.hidden = YES;
    return header;
}

- (void)enablePullRefresh {
    [self enablePullRefresh: _listView];
}

- (void)enablePullRefresh:(UIScrollView *)view {
    if (view) {
        view.header = [self mjRefreshHeaderCreator];
    }
}

- (void)refreshTriggeer:(MJRefreshHeader *)header {
    _page = 1;
    [DSHDevelopmentHelper runInBackgroundThread:^{
        NSArray *data = [self loadListData];
        [DSHDevelopmentHelper runInMainThread:^{
            if (data) {
                [_data removeAllObjects];
                if (data.count > 0) {
                    [_data addObjectsFromArray: data];
                }
                
                if (_kind_of_(_listView, UITableView)) {
                    [((UITableView *)_listView) reloadData];
                } else {
                    if (_kind_of_(_listView, UICollectionView)) {
                        [((UICollectionView *)_listView) reloadData];
                    }
                }
            }
            
            [header endRefreshing];
        }];
    }];
}

- (MJRefreshFooter *)mjRefreshFooterCreator {
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget: self refreshingAction: @selector(loadMoreTriggeer:)];
    return footer;
}

- (void)enablePullLoadMore {
    [self enablePullLoadMore: _listView];
}

- (void)enablePullLoadMore:(UIScrollView *)view {
    if (view) {
        view.footer = [self mjRefreshFooterCreator];
    }
}

- (void)loadMoreTriggeer:(MJRefreshFooter *)footer {
    _page++;
    [DSHDevelopmentHelper runInBackgroundThread:^{
        NSArray *data = [self loadListData];
        [DSHDevelopmentHelper runInMainThread:^{
            if (data) {
                if (data.count > 0) {
                    [_data addObjectsFromArray: data];
                }
                
                if (_kind_of_(_listView, UITableView)) {
                    [((UITableView *)_listView) reloadData];
                } else {
                    if (_kind_of_(_listView, UICollectionView)) {
                        [((UICollectionView *)_listView) reloadData];
                    }
                }
            }
            
            [footer endRefreshing];
        }];
    }];
}

#endif

@end
