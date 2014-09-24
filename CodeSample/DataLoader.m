//
//  DataLoader.m
//  CodeSample
//
//  Copyright (c) 2014 Golden Frog, Inc. All rights reserved.
//

#import "DataLoader.h"
#import "DataModel.h"
#import "LoadCounter.h"
#import "NetworkManager.h"

@interface DataLoader ()
@property(nonatomic, strong) id<DataReceiver> loadDelegate;
@property(nonatomic, strong) NSArray/*NewsPost*/ *data;
@end

@implementation DataLoader

- (id)dataLoaderWithDelegate:(id<DataReceiver>)delegate
{
    DataLoader *loader = [[DataLoader alloc] init];
    loader.loadDelegate = delegate;
    
    return loader;
}

- (void)getDataForSearchTerm:(NSString *)searchTerm
{
    self.data = [DataModel getDataForSearchTerm:searchTerm];
    __weak typeof (self) weakSelf = self;
    // if CoreData doesn't have the data for this search term then go and fetch it from server
    if([self.data count] == 0){
        [NetworkManager getDataForSearchTerm:searchTerm withCallBack:^(BOOL sucess, id response) {
            typeof(self)strongSelf = weakSelf;
            NSDictionary *apiData = response[@"data"];
            NSArray *apiChildren = apiData[@"children"];
            // Save it in the CoreData for future use
            [DataModel saveData:apiChildren forSearchTerm:searchTerm];
            // Now Retrieve the data from the core data
            self.data = [DataModel getDataForSearchTerm:searchTerm];
            dispatch_async(dispatch_get_main_queue(), ^{
                [strongSelf.loadDelegate updateCount:self.data.count];
                [strongSelf.loadDelegate receivedData:self.data];
            });
        }];
    }else{
        [self.loadDelegate updateCount:self.data.count];
        [self.loadDelegate receivedData:self.data];
    }
}

@end
