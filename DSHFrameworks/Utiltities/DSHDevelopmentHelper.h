//
//  DSHDevelopmentHelper.h
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <Foundation/Foundation.h>



#define _kind_of_(val, cls) \
    [val isKindOfClass: cls.class]

#define _kind_of_number(val) \
    [val isKindOfClass: NSNumber.class]

#define _kind_of_string(val) \
    [val isKindOfClass: NSString.class]

#define _kind_of_data(val) \
    [val isKindOfClass: NSData.class]

#define _kind_of_array(val) \
    [val isKindOfClass: NSArray.class]

#define _kind_of_dictionary(val) \
    [val isKindOfClass: NSDictionary.class]

@interface DSHDevelopmentHelper : NSObject

/**
 在主线程中执行block
 */
+ (void)runInMainThread:(dispatch_block_t)block;

/**
 在后台现成中执行block
 */
+ (void)runInBackgroundThread:(dispatch_block_t)block;

/**
 以特定级别在后台现成中执行block
 protity -> DISPATCH_QUEUE_PRIORITY_DEFAULT | DISPATCH_QUEUE_PRIORITY_HIGH ...
 */
+ (void)runInBackgroundThread:(dispatch_block_t)block priority:(int)protity;

@end
