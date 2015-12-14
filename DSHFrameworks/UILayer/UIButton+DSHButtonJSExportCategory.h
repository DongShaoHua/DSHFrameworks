//
//  UIButton+DSHButtonJSExportCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/11.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol DSHUIButtonJSExportProtocol <JSExport>

- (void)setTitle:(NSString *)title forState:(UIControlState)state;

@end

@interface UIButton (DSHButtonJSExportCategory)<DSHUIButtonJSExportProtocol>
@end
