//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface PhotoUploader : NSObject
- (void)uploadPhoto:(UIImage *)image completion:(void (^)(NSError *))completion;
@end
