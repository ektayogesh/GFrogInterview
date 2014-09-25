//
//  UIImage+Helper.h
//  FanFare_Question
//
//  Created by Ekta Agrawal on 9/18/14.
//  Copyright (c) 2014 ekta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helper)
+ (void) loadFromURL: (NSURL*) url callback:(void (^)(UIImage *image))callback;
@end
