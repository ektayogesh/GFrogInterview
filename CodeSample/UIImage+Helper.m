//
//  UIImage+Helper.m
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/18/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import "UIImage+Helper.h"

@implementation UIImage (Helper)
+ (void) loadFromURL: (NSURL*) url callback:(void (^)(UIImage *image))callback {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData * imageData = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:imageData];
            callback(image);
        });
    });
}
@end
