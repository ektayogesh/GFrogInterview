//
//  GFTableViewCell.h
//  CodeSample
//
//  Copyright (c) 2014 Golden Frog, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsPost.h"

@interface GFTableViewCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *title; //Ekta: changed be weak property, as this will already be retained by its superview.
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;

-(void)updateCellWithNewsPost:(NewsPost*)newsPost;
@end
