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

#if __has_include(header_file_for_gddataxmlnode)
- (DSHLayoutView *)viewWithElement:(GDataXMLElement *)element parent:(DSHLayoutView *)parent;
#endif

@end

#define LayoutKeyForView "LayoutKeyForView"

@implementation DSHLayoutParser

- (instancetype)init {
    self = [super init];
    if (self) {
        _window = [[JSContext alloc] init];
    }
    return self;
}

- (DSHLayoutElement *)parserWithFile:(NSString *)filePath {
    DSHLayoutElement *element = nil;
#if __has_include(header_file_for_gddataxmlnode)
    if ([[NSFileManager defaultManager] fileExistsAtPath: filePath]) {
        NSString *xmlString = [NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: nil];
        if (!_is_string_nil_or_empty(xmlString)) {
            GDataXMLDocument *xmldocument = [[GDataXMLDocument alloc] initWithXMLString: xmlString error: nil];
            if (xmldocument) {
                element = [DSHLayoutElement new];
                GDataXMLElement *root = [xmldocument rootElement];
                GDataXMLElement *vars = [[root elementsForName: @"Vars"] firstObject];
                if (vars && vars.children) {
                }
                
                GDataXMLElement *funcs = [[root elementsForName: @"Funcs"] firstObject];
                if (funcs && funcs.children) {
                    for (GDataXMLElement *funcElement in funcs.children) {
                        NSString *name = funcElement.name;
                        NSString *value = funcElement.stringValue;
                        if (!_is_string_nil_or_empty(value) && !_is_string_nil_or_empty(name)) {
                            [element.functions setValue: value forKey: name];
                        }
                    }
                }
                
                GDataXMLElement *layouts = [[root elementsForName: @"Layouts"] firstObject];
                if (layouts && layouts.children && layouts.childCount > 0) {
                    for (GDataXMLElement *viewElement in layouts.children) {
                        DSHLayoutView *layoutView = [self viewWithElement: viewElement parent: nil];
                        if (layoutView) {
                            [element.layoutViews addObject: layoutView];
                        }
                    }
                }
            }
        }
    }
#endif
    return element;
}

#if __has_include(header_file_for_gddataxmlnode)
- (DSHLayoutView *)viewWithElement:(GDataXMLElement *)element parent:(DSHLayoutView *)parent {
    DSHLayoutView *layoutView = nil;
    if (element) {
        layoutView = [DSHLayoutView new];
        if (parent) {
            [parent.subItems addObject: layoutView];
        }
        
        layoutView.viewClassName = element.name;
        if (element.attributes) {
            for (GDataXMLNode *attribute in element.attributes) {
                NSString *name = attribute.name;
                NSString *value = attribute.stringValue;
                if (!_is_string_nil_or_empty(name) && !_is_string_nil_or_empty(value)) {
                    DSHLayoutViewProperty *property = [DSHLayoutViewProperty propertyWith: name andValue: value];
                    [layoutView.viewProperties addObject: property];
                }
            }
        }
        
        if (element.children) {
            for (GDataXMLElement *child in element.children) {
                [self viewWithElement: child parent: layoutView];
            }
        }
    }
    return layoutView;
}
#endif

@end
