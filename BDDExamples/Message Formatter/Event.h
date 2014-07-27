//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol Event <NSObject>

@property(nonatomic, readonly) NSString *name;

@property(nonatomic, readonly) NSDate *startDate;
@property(nonatomic, readonly) NSDate *endDate;

@end
