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


extern NSString * const DSHListDefaultCellId;

@interface DSHListViewController : DSHViewController

@property (strong, nonatomic) NSMutableArray *data;
@property (assign, nonatomic) int page;

#pragma mark ====== 列表配置 =======
/**
 获取列表视图
 */
- (__kindof id)getListView;
/**
 获取Cell的id
 */
- (NSString *)getCellId;
/**
 返回列表视图的数据个数
 */
- (NSInteger)getListDataCount;
/**
 返回列表指定index处的cell
 */
- (__kindof UIView *)getCellWith:(__kindof  UIView *)listView forIndexPath:(NSIndexPath *)indePath;
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