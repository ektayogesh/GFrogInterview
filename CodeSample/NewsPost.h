//
//  NewsPost.h
//  CodeSample
//
//  Created by Ekta Agrawal on 9/23/14.
//  Copyright (c) 2014 Golden Frog, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SearchResult;

@interface NewsPost : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * thumbnailImageURL;
@property (nonatomic, retain) SearchResult *searchResult;

@end
