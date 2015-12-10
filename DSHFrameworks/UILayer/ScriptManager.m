//
//  ScriptManager.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/10.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "ScriptManager.h"

// documentView.webView.mainFrame.javaScriptContext

@implementation ScriptManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _window = [JSContext new];
    }
    return self;
}

- (instancetype)initWithContext:(JSContext *)window {
    self = [super init];
    if (self) {
        _window = window;
    }
    return self;
}

@end
