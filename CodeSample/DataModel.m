//
//  NewsPostModel.m
//  CodeSample
//
//  Created by Ekta Agrawal on 9/23/14.
//  Copyright (c) 2014 Golden Frog, Inc. All rights reserved.
//

#import "DataModel.h"
#import "AppDelegate.h"
#import "NewsPost.h"
#import "SearchResult.h"
@implementation DataModel

+(void)saveData:(NSArray/*NSDictionary*/*)data forSearchTerm:(NSString*)searchTerm{
    
    NSError *error;
    NSManagedObjectContext *context= [(AppDelegate*)[[UIApplication sharedApplication] delegate]managedObjectContext];
    SearchResult *searchResult = [NSEntityDescription insertNewObjectForEntityForName:@"SearchResult" inManagedObjectContext:context];
    searchResult.searchTerm = searchTerm;
    for(NSDictionary *dict in data)
    {
        NewsPost *newsPost= [NSEntityDescription insertNewObjectForEntityForName:@"NewsPost" inManagedObjectContext:context];
        newsPost.title = dict[@"data"][@"title"];
        if(dict[@"data"][@"thumbnail"] && [dict[@"data"][@"thumbnail"] length]>0)
        {
            newsPost.thumbnailImageURL = dict[@"data"][@"thumbnail"]; //not sure what does "self" means for the thumbnail value from server in some cases.
        }
        [searchResult addNewsPostObject:newsPost];
    }
    if (![context save:&(error)]) {
        NSLog(@"Whoops, couldn't save the Data for search term : %@ and error is %@", searchTerm,[error localizedDescription]);
        
    }
}

+(NSArray/*NewsPost*/*)getDataForSearchTerm:(NSString*)searchTerm{
    NSArray* newsPostArray;
    NSError *error;
    NSManagedObjectContext *context= [(AppDelegate*)[[UIApplication sharedApplication] delegate]managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:[NSEntityDescription entityForName:@"SearchResult" inManagedObjectContext:context]];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"searchTerm = %@",searchTerm];
    [request setPredicate:predicate];
    NSArray* searchResultArray =[context executeFetchRequest:request error:&error];
    if([searchResultArray count] > 0){
        newsPostArray = [[[searchResultArray objectAtIndex:0] newsPost] allObjects];
    }
    if(error)
    {
        NSLog(@"Error is %@ in getDataForSearchTerm",[error localizedDescription]);
    }
    return newsPostArray;
}
@end

