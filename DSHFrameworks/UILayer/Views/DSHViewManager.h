//
//  DSHViewManager.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/9.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DSHLayoutElement.h"

@interface DSHViewManager : NSObject

@property (assign, nonatomic) BOOL enableDebug;
@property (strong, nonatomic) NSMutableDictionary<NSString *, DSHLayoutElement *> *layouts;

- (NSArray<__kindof UIView *> *)viewWithFile:(NSString *)layoutFileName parentView:(UIView *)parentView;

@end

