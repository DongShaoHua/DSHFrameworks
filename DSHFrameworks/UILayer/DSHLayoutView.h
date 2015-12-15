//
//  DSHLayoutView.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/14.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "DSHLayoutViewProperty.h"

@class DSHLayoutView;

@interface DSHLayoutView : NSObject

@property (strong, nonatomic) NSString *viewClassName;
@property (strong, nonatomic) NSMutableArray<DSHLayoutViewProperty *> *viewProperties;
@property (strong, nonatomic) NSMutableArray<DSHLayoutView *> *subItems;

- (__kindof UIView *)viewWithLayout:(UIView *)parent environment:(JSContext *)window;

@end
