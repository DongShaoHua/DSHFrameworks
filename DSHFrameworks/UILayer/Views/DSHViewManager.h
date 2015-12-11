//
//  DSHViewManager.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/9.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ScriptManager.h"

@class DSHLayoutEntity;
@class DSHLayoutEntityProperty;

@interface DSHViewManager : NSObject

@property (strong, nonatomic) NSString *layoutFileName;

@property (strong, nonatomic) ScriptManager *manager;

- (__kindof UIView *)viewWithFile:(NSString *)entityFileName parentView:(UIView *)parentView;

@end

