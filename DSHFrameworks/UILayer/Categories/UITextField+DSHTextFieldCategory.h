//
//  UITextField+DSHTextFieldCategory.h
//  
//
//  Created by dongsh on 15/12/8.
//
//

#import <UIKit/UIKit.h>

@interface UITextField (DSHTextFieldCategory)

- (void)registerTextValid:(void (^)(UITextField *))block;
- (void)removeTextValid;

@end
