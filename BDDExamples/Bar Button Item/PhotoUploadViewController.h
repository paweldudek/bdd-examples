//
//  Copyright (c) 2014 Pawel Dudek. All rights reserved.
//


#import <Foundation/Foundation.h>

@class PhotoUploader;


@interface PhotoUploadViewController : UIViewController
@property(nonatomic, readonly) PhotoUploader *photoUploader;

- (instancetype)initWithPhotoUploader:(PhotoUploader *)photoUploader;

@end
