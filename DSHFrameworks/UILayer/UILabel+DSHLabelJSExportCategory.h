//
//  UILabel+DSHLabelJSExportCategory.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/15.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol DSHLabelJSExportProtocol <JSExport>

@property (strong, nonatomic) NSString *text;

@end

@interface UILabel (DSHLabelJSExportCategory)<DSHLabelJSExportProtocol>



@end
