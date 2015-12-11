//
//  DSHLayoutParser.m
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/11.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "DSHLayoutParser.h"

@interface DSHLayoutParser()<NSXMLParserDelegate>

@end

@implementation DSHLayoutParser

- (__kindof UIView *)loadViewWithUrl:(NSURL *)url {
    UIView *view = nil;
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL: url];
    parser.delegate = self;
    [parser parse];
    
    return view;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
}

@end
