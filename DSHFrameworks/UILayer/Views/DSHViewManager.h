//
//  DSHViewManager.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/9.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSHLayoutEntity;
@class DSHLayoutEntityProperty;

@interface DSHViewManager : NSObject

@property (strong, nonatomic) NSString *entityFileName;

- (__kindof UIView *)viewWithFile:(NSString *)entityFileName parentView:(UIView *)parentView;
- (__kindof UIView *)viewWithEntity:(DSHLayoutEntity *)entity  parentView:(UIView *)parentView;

@end

@interface DSHLayoutEntityProperty : NSObject

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) id value;

+ (DSHLayoutEntityProperty *)propertyWithJson:(NSDictionary *)json parentView:(UIView *)parentView;

@end

@interface DSHLayoutEntity : NSObject

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSMutableArray<NSDictionary *> *subviews;
@property (strong, nonatomic) NSMutableArray<NSDictionary *> *properties;
@property (strong, nonatomic) NSArray<DSHLayoutEntityProperty *> *entityProperties;

- (__kindof UIView *)createViewWithEntity:(UIView *)parentView;

@end
