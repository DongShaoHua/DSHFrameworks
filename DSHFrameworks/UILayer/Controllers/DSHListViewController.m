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

- (id)getListView {
    return _listView;
}

- (NSString *)getCellId {
    return DSHListDefaultCellId;
}

- (NSInteger)getListDataCount {
    return self.data.count;
}

- (UIView *)getCellWith:(UIView *)listView forIndexPath:(NSIndexPath *)indePath {
    return nil;
}

- (void)configRowDetail:(UIView *)listView cell:(UIView *)cell forIndexPath:(NSIndexPath *)indexPath {
    if ([listView isEqual: _listView]) {
        if (_data.count > indexPath.row) {
            id data = _data[indexPath.row];
            if (_kind_of_(cell, DSHTableViewCell)) {
                [((DSHTableViewCell *)cell) setCellDetail: data];
            } else {
                if (_kind_of_(cell, DSHCollectionViewCell)) {
                    [((DSHCollectionViewCell *)cell) setCellDetail: data];
                }
            }
        }
    }
}

- (__kindof id)loadListData {
    return nil;
}

- (void)refreshTriggeer:(UIView *)header {
    
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
