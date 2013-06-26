//
//  FirstViewController.m
//  Diabetic's Log
//
//  Created by Michael Smith on 3/27/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import "FirstViewController.h"
#import "LogEntryViewController.h"
#import "LogItemListViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Home", @"Home");
        self.tabBarItem.image = [UIImage imageNamed:@"Home"];
        
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.tintColor = [UIColor brownColor];
}

-(IBAction)onLogEntryClick:(id)sender
{
    LogEntryViewController *addNewLog = [[LogEntryViewController alloc] initWithNibName:@"LogEntryViewController" bundle:nil];
    if (addNewLog != nil)
    {
        
        [self.navigationController pushViewController:addNewLog animated:TRUE];
    }
}
-(IBAction)onLogListClick:(id)sender
{
    LogItemListViewController *viewLogList = [[LogItemListViewController alloc] initWithNibName:@"LogItemListViewController" bundle:nil];
    if (viewLogList != nil)
    {
        
        [self.navigationController pushViewController:viewLogList animated:TRUE];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
