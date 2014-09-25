//
//  NewsPostModel.h
//  CodeSample
//
//  Created by Ekta Agrawal on 9/23/14.
//  Copyright (c) 2014 Golden Frog, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataLoader.h"

@interface DataModel : NSObject

+(void)saveData:(NSArray/*NSDictionary*/*)data forSearchTerm:(NSString*)searchTerm;
+(NSArray/*NewsPost*/*)getDataForSearchTerm:(NSString*)searchTerm;
@end
