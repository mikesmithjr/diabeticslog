//
//  LogItemListViewController.m
//  Diabetic's Log
//
//  Created by Michael Smith on 3/27/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import "LogItemListViewController.h"
#import "EditLogEntryViewController.h"
#import "ShareListViewController.h"
#import "LogItemInfo.h"

@interface LogItemListViewController ()

@end

@implementation LogItemListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Log Item List";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(onShareClick:forEvent:)];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if (documentsDirectory != nil)
    {
        NSString *fullPath = [[NSString alloc] initWithFormat:@"%@/%@", documentsDirectory, @"logItemList.plist"];
        //NSLog(@"%@", fullPath);
        BOOL fileThere = [[NSFileManager defaultManager] fileExistsAtPath:fullPath];
        if (fileThere)
        {
            
            logItemList = [[NSMutableArray alloc] initWithContentsOfFile:fullPath];
            NSLog(@"%@", [logItemList description]);
            logItemsArray = [[NSMutableArray alloc]init];
            for (int i=0; i<[logItemList count]; i++)
            {
                //NSArray *eachLogItemArray = [logItems objectAtIndex:i];
                //NSLog(@"%@", [eachLogItemArray description]);
                NSString * theDate = [[logItemList objectAtIndex:i] objectForKey:@"currentDate"];
                NSString * theTime = [[logItemList objectAtIndex:i] objectForKey:@"currentTime"];
                NSString * theReason = [[logItemList objectAtIndex:i] objectForKey:@"reason"];
                NSString * theReading = [[logItemList objectAtIndex:i] objectForKey:@"reading"];
                LogItemInfo *logItem = [[LogItemInfo alloc] initLogItemInfo:theDate currentTime:theTime reason:theReason reading:theReading];
                [logItemsArray addObject:logItem];
                
            }
        }
        
    }
    
}

-(void)onShareClick:(id)sender forEvent:(UIEvent *)event
{
    ShareListViewController *shareList = [[ShareListViewController alloc] init];
    [self.navigationController pushViewController:shareList animated:YES];
}


- (void)viewDidAppear:(BOOL)animated
{
    //deselect any item in the table when page appears
    [table deselectRowAtIndexPath:[table indexPathForSelectedRow] animated:false];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return [logItemsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //sets default cell indentifier
    static NSString *cellIdentify = @"cell";
    //sets up reusable cells
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:cellIdentify];
    
    //sets up table view with custom cell and article names
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentify];
        
    }
    LogItemInfo *logItem = [logItemsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = logItem.currentDate;
    cell.detailTextLabel.text = logItem.currentTime;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //initializes item detail view controller to show detail view when cell is selected
    EditLogEntryViewController *viewItemDetail = [[EditLogEntryViewController alloc] initWithNibName:@"EditLogEntryViewController" bundle:nil];
    if(viewItemDetail !=nil)
    {
        LogItemInfo *detailLogItem = [logItemsArray objectAtIndex:indexPath.row];
        //sets article name variable to the name of the item in the array that is selected
        viewItemDetail.logItemDetail = detailLogItem;
        //launches new view
        [self presentViewController:viewItemDetail animated:TRUE completion:nil];
    }
}
@end
