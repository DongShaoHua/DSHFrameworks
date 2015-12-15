//
//  UIView+DSHViewCategory.m
//  DSHFrameworks
//
//  Created by dongsh on 15/11/26.
//  Copyright © 2015年 dongsh. All rights reserved.
//

#import "UIView+DSHViewCategory.h"
#import "DSHDevelopmentHelper.h"

@implementation UIView (DSHViewCategory)

+ (__kindof UIView *)loadViewFromNib {
    NSString *name = [[self class] description];
    return [self loadViewFromNib: name];
}

+ (__kindof UIView *)loadViewFromNib:(NSString *)nibFileName {
    return [[[NSBundle mainBundle] loadNibNamed: nibFileName owner: nil options: nil] firstObject];
}

+ (void)enumAllChildren:(UIView *)view usingBlock:(void (^)(__kindof UIView *))block {
    NSArray<UIView *> *subviews = view.subviews;
    if (subviews && subviews.count > 0) {
        for (UIView *subview in subviews) {
            if (block) {
                block(subview);
            }
            [self enumAllChildren: subview usingBlock: block];
        }
    }
}

- (void)enumerateAllChildren:(void (^)(__kindof UIView *))block {
    [UIView enumAllChildren: self usingBlock: block];
}

- (__kindof UIView *)firstParentOfClass:(Class)viewClass {
    UIView *superview = self.superview;
    while (superview) {
        if ([superview isKindOfClass: viewClass]) {
            return superview;
        }
        superview = superview.superview;
    }
    return nil;
}

- (__kindof UIView *)firstChildOfClass:(Class)viewClass {
    __block UIView *child = nil;
    [self enumerateAllChildren:^(__kindof UIView *subview) {
        if (!child && [subview isKindOfClass: viewClass]) {
            child = subview;
        }
    }];
    return child;
}

- (void)fedeIn {
    [self fedeIn: 0.5];
}

- (void)fedeIn:(NSTimeInterval)timeinterval {
    [self fedeIn: timeinterval completed: nil];
}

- (void)fedeIn:(NSTimeInterval)timeinterval completed:(dispatch_block_t)completed {
    [UIView animateWithDuration: timeinterval animations: ^{
        self.alpha = 1.0f;
    } completion:^(BOOL finished) {
        if (completed) {
            completed();
        }
    }];

}

- (void)fedeOut {
    [self fedeOut: 0.5];
}

- (void)fedeOut:(NSTimeInterval)timeinterval {
    [self fedeOut: timeinterval completed: nil];
}

- (void)fedeOut:(NSTimeInterval)timeinterval completed:(dispatch_block_t)completed {
    [UIView animateWithDuration: timeinterval animations: ^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        if (completed) {
            completed();
        }
    }];
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)radius {
    self.layer.cornerRadius = radius;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor: self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (void)clipToCircle {
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    if (width == height) {
        [self setCornerRadius: half_of_number(width)];
    } else {
        CGFloat radius = half_of_number((width > height ? height : width));
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter: CGPointMake(half_of_number(width), half_of_number(height) ) radius: radius startAngle:0 endAngle: 2 * M_PI clockwise: NO];
        CAShapeLayer *shaper = [CAShapeLayer layer];
        shaper.path = path.CGPath;
        self.layer.mask = shaper;
    }
}

@end
