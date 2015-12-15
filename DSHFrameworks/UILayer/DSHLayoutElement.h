//
//  DSHLayoutElement.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/14.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "DSHLayoutView.h"

@interface DSHLayoutElement : NSObject

@property (strong, nonatomic) NSMutableDictionary<NSString *, id> *variables;
@property (strong, nonatomic) NSMutableArray<DSHLayoutView *> *layoutViews;
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *functions;

- (NSArray<__kindof UIView *> *)viewWithElement:(UIView *)parent environment:(JSContext *)window;

@end
