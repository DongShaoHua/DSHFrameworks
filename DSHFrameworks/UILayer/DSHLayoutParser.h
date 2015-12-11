//
//  DSHLayoutParser.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/11.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSHLayoutParser : NSObject

@property (strong, nonatomic) NSMutableDictionary<NSString *, NSString *> *functions;

- (__kindof UIView *)loadViewWithUrl:(NSString *)filePath parentView:(__kindof UIView *)parentView;

@end
