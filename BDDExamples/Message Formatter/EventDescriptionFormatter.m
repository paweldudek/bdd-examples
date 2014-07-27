//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//

#import "EventDescriptionFormatter.h"
#import "Event.h"


@implementation EventDescriptionFormatter

- (id)init {
    self = [super init];
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.timeStyle = NSDateFormatterShortStyle;
        self.dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }

    return self;
}

- (NSString *)eventDescriptionFromEvent:(id <Event>)event {
    return     [NSString stringWithFormat:@"%@ starts at %@ and ends at %@.", event.name,
                                   [self.dateFormatter stringFromDate:event.startDate],
                                   [self.dateFormatter stringFromDate:event.endDate]];
}

@end
