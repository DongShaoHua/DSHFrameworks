//
//  UITextField+DSHTextFieldCategory.h
//  
//
//  Created by dongsh on 15/12/8.
//
//

#import <UIKit/UIKit.h>

@interface UITextField (DSHTextFieldCategory)

/**
 注册文本改变时，执行的block
*/
- (void)registerTextValid:(void (^)(UITextField *))block;
/**
 移除文本改变时，执行的block
 */
- (void)removeTextValid;

@end



