//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import "UIView+Specs.h"


@implementation UIView (Specs)

- (UIButton *)specsFindButtonWithTitle:(NSString *)title {
    NSPredicate *buttonPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([evaluatedObject isKindOfClass:[UIButton class]]) {
            if ([[evaluatedObject currentTitle] isEqualToString:title]) {
                return YES;
            }
        }
        return NO;
    }];

    NSArray *allMatches = [self traverseChildrenWithPredicate:buttonPredicate];
    return [allMatches firstObject];
}

- (UITextField *)specsFindTextFieldWithPlaceholder:(NSString *)title {
    NSPredicate *buttonPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([evaluatedObject isKindOfClass:[UITextField class]]) {
            if ([[evaluatedObject placeholder] isEqualToString:title]) {
                return YES;
            }
        }
        return NO;
    }];

    NSArray *allMatches = [self traverseChildrenWithPredicate:buttonPredicate];
    return [allMatches firstObject];}


#pragma mark -

- (NSArray *)traverseChildrenWithPredicate:(NSPredicate *)predicate {
    return [[self subviews] filteredArrayUsingPredicate:predicate];
}

@end
