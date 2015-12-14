//
//  DSHLayoutParser.h
//  DSHFrameworksIOSExample
//
//  Created by dongsh on 15/12/11.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSHLayoutElement.h"

@interface DSHLayoutParser : NSObject

- (DSHLayoutElement *)parserWithFile:(NSString *)filePath;

@end
