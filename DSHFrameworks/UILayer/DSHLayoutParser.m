//
//  DSHLayoutParser.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/11.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <objc/runtime.h>
#import <JavaScriptCore/JavaScriptCore.h>

#import "DSHLayoutParser.h"
#import "DSHDevelopmentHelper.h"
#import "NSString+DSHStringCategory.h"

#import "DSHLayoutViewProperty.h"

#if __has_include("GDataXMLNode.h")

#define header_file_for_gddataxmlnode "GDataXMLNode.h"

#else

#define header_file_for_gddataxmlnode <GDataXMLNode.h>

#endif

#if __has_include(header_file_for_gddataxmlnode)

#import header_file_for_gddataxmlnode

#endif


@interface DSHLayoutParser()

@property (strong, nonatomic) JSContext *window;

- (UIView *)viewWithElement:(GDataXMLElement *)element parentView:(UIView *)parentView;

@end

#define LayoutKeyForView "LayoutKeyForView"

@implementation DSHLayoutParser

- (instancetype)init {
    self = [super init];
    if (self) {
        _window = [[JSContext alloc] init];
        _functions = [NSMutableDictionary dictionary];
    }
    return self;
}

#if __has_include(header_file_for_gddataxmlnode)
- (UIView *)viewWithElement:(GDataXMLElement *)element parentView:(UIView *)parentView {
    UIView *view = nil;
    if (element) {
        view = (UIView *)[NSClassFromString(element.name) new];
        if (_kind_of_(view, UIView)) {
            if (parentView) {
                [parentView addSubview: view];
            }
            
            if (element.attributes) {
                
                for (GDataXMLNode *attribute in element.attributes) {
                    NSString *name = attribute.name;
                    NSString *value = attribute.stringValue;
                    if ([@"key" isEqualToString: name] && !_is_string_nil_or_empty(value)) {
                        objc_setAssociatedObject(view, LayoutKeyForView, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                        _window[value] = view;
                    } else {
                        if ([@"init" isEqualToString: name] && !_is_string_nil_or_empty(value)) {
                            NSString *initScript = _functions[value];
                            [((UIButton *)view)setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
                            if (!_is_string_nil_or_empty(initScript)) {
                                JSValue *value = [_window evaluateScript: initScript];
                                NSLog(@"%@", [_window.exception toString]);
                            }
                        } else {
                            DSHLayoutViewProperty *property = [DSHLayoutViewProperty propertyWith: name andValue: value parentView: parentView];
                            if (property) {
                                [property bindView: view];
                            }
                        }
                    }
                }
            }
            
            if (element.children) {
                for (GDataXMLElement *child in element.children) {
                    [self viewWithElement: child parentView: view];
                }
            }
        }
    }
    return view;
}
#endif

- (__kindof UIView *)loadViewWithUrl:(NSString *)filePath parentView:(__kindof UIView *)parentView {
    UIView *view = nil;
    [_functions removeAllObjects];
#if __has_include(header_file_for_gddataxmlnode)
    if ([[NSFileManager defaultManager] fileExistsAtPath: filePath]) {
        NSString *xmlString = [NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: nil];
        if (!_is_string_nil_or_empty(xmlString)) {
            GDataXMLDocument *xmldocument = [[GDataXMLDocument alloc] initWithXMLString: xmlString error: nil];
            if (xmldocument) {
                GDataXMLElement *root = [xmldocument rootElement];
                GDataXMLElement *vars = [[root elementsForName: @"Vars"] firstObject];
                
                GDataXMLElement *funcs = [[root elementsForName: @"Funcs"] firstObject];
                if (funcs && funcs.children) {
                    for (GDataXMLElement *funcElement in funcs.children) {
                        NSString *name = funcElement.name;
                        NSString *value = funcElement.stringValue;
                        if (!_is_string_nil_or_empty(value)) {
                            [_functions setValue: value forKey: name];
                        }
                    }
                }
                
                GDataXMLElement *layouts = [[root elementsForName: @"Layouts"] firstObject];
                if (layouts && layouts.children) {
                    for (GDataXMLElement *viewElement in layouts.children) {
                        [self viewWithElement: viewElement parentView: parentView];
                    }
                }
            }
        }
    }
#endif
    return view;
}

@end
