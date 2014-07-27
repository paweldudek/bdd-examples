//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Event;

@interface EventDescriptionFormatter : NSObject
@property(nonatomic, strong) NSDateFormatter *dateFormatter;

- (NSString *)eventDescriptionFromEvent:(id <Event>)event;

@end
