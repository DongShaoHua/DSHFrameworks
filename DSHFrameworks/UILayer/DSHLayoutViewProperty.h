//
//  DSHLayoutViewProperty.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/11.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef id (^PropertyValueHandleBlock)(NSString *propertyValue, __kindof UIView *parentView);

@interface DSHLayoutViewProperty : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) id value;

- (void)bindView:(UIView *)view;

+ (instancetype)propertyWith:(NSString *)name andValue:(NSString *)value parentView:(__kindof UIView *)parentView;

+ (void)addPropertyHandleBlock:(NSString *)property block:(PropertyValueHandleBlock) block;

@end
