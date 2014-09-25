//
//  NetworkHelper.h
//  CodeSample
//
//  Created by Ekta Agrawal on 9/23/14.
//  Copyright (c) 2014 Golden Frog, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

+(void)getDataForSearchTerm:(NSString*)searchTerm withCallBack:(void(^)(BOOL sucess, id response)) callBack;
@end
