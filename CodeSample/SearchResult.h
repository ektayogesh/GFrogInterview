//
//  SearchResult.h
//  CodeSample
//
//  Created by Ekta Agrawal on 9/23/14.
//  Copyright (c) 2014 Golden Frog, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NewsPost;

@interface SearchResult : NSManagedObject

@property (nonatomic, retain) NSString * searchTerm;
@property (nonatomic, retain) NSSet *newsPost;
@end

@interface SearchResult (CoreDataGeneratedAccessors)

- (void)addNewsPostObject:(NewsPost *)value;
- (void)removeNewsPostObject:(NewsPost *)value;
- (void)addNewsPost:(NSSet *)values;
- (void)removeNewsPost:(NSSet *)values;

@end
