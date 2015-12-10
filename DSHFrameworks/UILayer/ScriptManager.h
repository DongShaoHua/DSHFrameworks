//
//  ScriptManager.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/10.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface ScriptManager : NSObject

@property (strong, nonatomic) JSContext *window;

- (instancetype)initWithContext:(JSContext *)window;

@end
