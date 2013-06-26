//
//  MedListViewController.m
//  Diabetic's Log
//
//  Created by Michael Smith on 3/27/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import "MedListViewController.h"
#import "MedEntryViewController.h"
#import "EditMedViewController.h"
#import "ShareListViewController.h"
#import "MedItemInfo.h"

@interface MedListViewController ()

@end

@implementation MedListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Med List", @"Med List");
        self.tabBarItem.image = [UIImage imageNamed:@"MedList"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor brownColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(onShareClick:forEvent:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAddClick:forEvent:)];
    
   
    
    
}
-(void)onShareClick:(id)sender forEvent:(UIEvent *)event
{
    ShareListViewController *shareList = [[ShareListViewController alloc] init];
    [self.navigationController pushViewController:shareList animated:YES];
}
-(void)onAddClick:(id)sender forEvent:(UIEvent *)event
{
    MedEntryViewController *addMed = [[MedEntryViewController alloc] init];
    [self.navigationController pushViewController:addMed animated:YES];
}



- (void)viewDidAppear:(BOOL)animated
{
    //deselect any item in the table when page appears
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if (documentsDirectory != nil)
    {
        NSString *fullPath = [[NSString alloc] initWithFormat:@"%@/%@", documentsDirectory, @"medItemList.plist"];
        //NSLog(@"%@", fullPath);
        BOOL fileThere = [[NSFileManager defaultManager] fileExistsAtPath:fullPath];
        if (fileThere)
        {
            
            medItemList = [[NSMutableArray alloc] initWithContentsOfFile:fullPath];
            //NSLog(@"%@", [medItemList description]);
            
            medItemsArray = [[NSMutableArray alloc]init];
            for (int i=0; i<[medItemList count]; i++)
            {
                
                NSString * theName = [[medItemList objectAtIndex:i] objectForKey:@"medName"];
                NSString * theTimes = [[medItemList objectAtIndex:i] objectForKey:@"medTime"];
                
                MedItemInfo *medItem = [[MedItemInfo alloc] initMedItemInfo:theName medTimes:theTimes];
                [medItemsArray addObject:medItem];
                
            }
        }
        
    }
    [table reloadData];
    [table deselectRowAtIndexPath:[table indexPathForSelectedRow] animated:false];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section
{
    return [medItemsArray count];
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
    MedItemInfo *medItem = [medItemsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = medItem.medName;
    cell.detailTextLabel.text = medItem.medTimes;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //initializes item detail view controller to show detail view when cell is selected
    EditMedViewController *viewItemDetail = [[EditMedViewController alloc] initWithNibName:@"EditMedViewController" bundle:nil];
    if(viewItemDetail !=nil)
    {
        //sets article name variable to the name of the item in the array that is selected
        MedItemInfo *detailMedInfo = [medItemsArray objectAtIndex:indexPath.row];
        viewItemDetail.medItemDetail = detailMedInfo;
        //launches new view
        [self presentViewController:viewItemDetail animated:TRUE completion:nil];
    }
}
@end
