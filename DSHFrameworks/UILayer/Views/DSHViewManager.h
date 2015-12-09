//
//  DSHViewManager.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/9.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSHViewManager : NSObject

+ (__kindof UIView *)viewWithFile:(NSString *)filePath parentView:(UIView *)parentView;

@end

@interface DSHLayoutEntityProperty : NSObject

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) id value;

+ (DSHLayoutEntityProperty *)propertyWithJson:(NSDictionary *)json;

@end

@interface DSHLayoutEntity : NSObject

@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSMutableArray<NSDictionary *> *properties;
@property (strong, nonatomic) NSArray<DSHLayoutEntityProperty *> *entityProperties;

- (__kindof UIView *)createViewWithEntity;

@end
