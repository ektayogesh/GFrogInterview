//
//  GFTableViewCell.m
//  CodeSample
//
//  Copyright (c) 2014 Golden Frog, Inc. All rights reserved.
//

#import "GFTableViewCell.h"
#import "UIImage+Helper.h"

@implementation GFTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)updateCellWithNewsPost:(NewsPost *)newsPost{
    
    self.title.text = newsPost.title;
    NSURL *url = [NSURL URLWithString:newsPost.thumbnailImageURL];
    [UIImage loadFromURL:url callback:^(UIImage *image) {
        self.thumbnailImageView.image = image;
    }];
}
@end
