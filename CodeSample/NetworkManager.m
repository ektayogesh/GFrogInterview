//
//  NetworkHelper.m
//  CodeSample
//
//  Created by Ekta Agrawal on 9/23/14.
//  Copyright (c) 2014 Golden Frog, Inc. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+(void)getDataForSearchTerm:(NSString*)searchTerm withCallBack:(void(^)(BOOL sucess, id response)) callBack{
    
    //Ekta: Added a search term which user has entered in the textfield
    // TODO: Add a parameter that is entered in a search field at the top of the table view.
    // You will need to add this search field, grab the search value, and use this value as the search term.
    // NSString *searchTerm = @"ferrari"; // default search term
     NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.reddit.com/search.json?q=%@", searchTerm]]];

    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError == nil)
        {
            NSDictionary *apiResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            callBack(YES, apiResponse);
            
        }
    }];
}
@end
