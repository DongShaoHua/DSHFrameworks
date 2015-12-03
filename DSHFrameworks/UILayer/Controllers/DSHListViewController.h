//
//  DSHListViewController.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHViewController.h"

#if __has_include("MJRefresh.h")

#define header_file_for_mjrefresh "MJRefresh.h"

#else

#define header_file_for_mjrefresh <MJRefresh.h>


#endif


#if __has_include(header_file_for_mjrefresh)

#import header_file_for_mjrefresh

#endif

extern NSString * const DSHListDefaultCellId;

@interface DSHCellNibInfo : NSObject

/**
 该cell的重用Id
 */
@property (strong, nonatomic) NSString *cellId;
/**
 该cell是否注册了nib
 */
@property (assign, nonatomic) BOOL hasNib;
/**
 该cell的构造代码快
 */
@property (strong, nonatomic) UITableViewCell * (^allocCellBlock)(NSString *cellId);

- (instancetype)initWithCellId:(NSString *)cellId andHasNib:(BOOL)hasNib allocCellBlock:(UITableViewCell * (^)(NSString *cellId))block;

+ (instancetype)infoWithCellId:(NSString *)cellId;
+ (instancetype)infoWithCellId:(NSString *)cellId andHasNib:(BOOL)hasNib;
+ (instancetype)infoWithCellId:(NSString *)cellId andHasNib:(BOOL)hasNib allocCellBlock:(UITableViewCell * (^)(NSString *cellId))block;

@end

@interface DSHListViewController : DSHViewController<UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource>

/**
 列表的数据
 */
@property (strong, nonatomic) NSMutableArray *data;

/**
 列表的页码信息
 */
@property (assign, nonatomic) int page;

#pragma mark ====== 列表信息配置 =======
/**
 获取列表视图
 */
- (__kindof UIView *)getListView;
/**
 获取Cell的信息，
 设置该Cell是否为list注册了Nib文件，
 设置该cell重用id，
 设置该cell的自定义构造代码快
 */
- (DSHCellNibInfo *)getCellInfoWith:(UIView *)view forIndexPath:(NSIndexPath *)indexPath;

#pragma mark ========= 列表相关方法 ==========
/**
 返回列表视图的数据个数
 */
- (NSInteger)getListDataCount:(UIView *)view forSection:(NSInteger)section;
/**
 返回列表指定index处的cell
 */
- (__kindof UIView *)listCell:(__kindof UIView *)listView forIndexPath:(NSIndexPath *)indePath;
/**
 获取指定list特定列的信息
 */
- (__kindof id)listData:(__kindof UIView *)listView forIndexPath:(NSIndexPath *)indexPath;
/**
 配置列表指定index处的cell信息
 */
- (void)configRowDetail:(__kindof UIView *)listView cell:(__kindof UIView *)cell forIndexPath:(NSIndexPath *)indexPath;

- (__kindof id)loadListData;

#if __has_include(header_file_for_mjrefresh)

#pragma mark ====== 启动 MJ 下拉和上拉 =======

- (MJRefreshHeader *)mjRefreshHeaderCreator;
- (void)enablePullRefresh;
- (void)enablePullRefresh:(UIScrollView *)view;
- (void)refreshTriggeer:(MJRefreshHeader *)header;

- (MJRefreshFooter *)mjRefreshFooterCreator;
- (void)enablePullLoadMore;
- (void)enablePullLoadMore:(UIScrollView *)view;
- (void)loadMoreTriggeer:(MJRefreshFooter *)footer;

#endif

@end

