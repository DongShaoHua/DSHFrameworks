//
//  ScriptManager.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/10.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "ScriptManager.h"
#import <objc/runtime.h>


@implementation ScriptManager

+ (void)load {
    class_addProtocol([UIButton class], @protocol(JSExportProtocol));
}

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

@implementation UIButton (ScriptCategory)

- (void)settitle:(NSString *)Title State:(int)State {
    [self setTitle: Title forState: UIControlStateNormal];
}

- (void)setButtonTitle:(NSString *)title Name:(NSString *)Name {
    [self setTitle: title forState: UIControlStateNormal];
}

@end
