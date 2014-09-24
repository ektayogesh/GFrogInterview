//
//  ViewController.m
//  CodeSample
//
//  Copyright (c) 2014 Golden Frog, Inc. All rights reserved.
//

#import "ViewController.h"
#import "DataLoader.h"
#import "GFTableViewCell.h"
#import "DataModel.h"
#import "NewsPost.h"

@interface ViewController ()
@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property NSUInteger tableCount;
@property(nonatomic, strong) NSArray *tableData;
@property(nonatomic, strong) DataLoader *data;

- (IBAction)searchAction:(id)sender; //Ekta : added for search action
- (IBAction)refreshAction:(id)sender; //Added for Reresh Action. Code was crashing due to unrecognized selector.the outlet was connected to Reresh: which is not defined here

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.data = [[DataLoader alloc] dataLoaderWithDelegate:self];
    self.tableData = [[NSMutableArray alloc]init]; //FIXED: initialize the array containing tableData
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GFTableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NewsPost *newsPost = [self.tableData objectAtIndex:indexPath.row];
    [newCell updateCellWithNewsPost:newsPost];

    return newCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableCount;
}

#pragma mark UITableViewDelegate

// TODO:

#pragma mark Helper Methods

- (void)refreshDataForSearchTerm:(NSString*)searchTerm
{
    
    [_data getDataForSearchTerm:searchTerm]; //FIXED warning: property access result unused getters should not be used for side effects.  _data.getData is meant for properties, not for methods.
    
}

#pragma mark Action Methods

- (IBAction)refreshAction:(id)sender
{
    [self refreshDataForSearchTerm:self.searchTextField.text];
}

- (IBAction)searchAction:(id)sender {
    [self refreshDataForSearchTerm:self.searchTextField.text];
}
#pragma mark Delegate Methods

-(void)receivedData:(NSArray *)data
{
    
    self.tableData = data;
    
    
    [self.tableView reloadData];
}

-(void)updateCount:(NSUInteger)newCount
{
    self.tableCount = newCount;
}


@end
