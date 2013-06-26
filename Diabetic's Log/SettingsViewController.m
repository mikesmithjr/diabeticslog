//
//  SettingsViewController.m
//  Diabetic's Log
//
//  Created by Michael Smith on 3/27/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import "SettingsViewController.h"
#import "EditDocInfoViewController.h"
#import "PersonalInfoViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Settings", @"Settings");
        self.tabBarItem.image = [UIImage imageNamed:@"Settings"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onEditPersonalClick:(id)sender
{
        PersonalInfoViewController *editPersonal = [[PersonalInfoViewController alloc] initWithNibName:@"PersonalInfoViewController" bundle:nil];
        if (editPersonal != nil)
        {
            
            [self presentViewController:editPersonal animated:TRUE completion:nil];
        }
    
}

-(IBAction)onEditDocClick:(id)sender
{
        EditDocInfoViewController *editDocInfo = [[EditDocInfoViewController alloc] initWithNibName:@"EditDocInfoViewController" bundle:nil];
        if (editDocInfo != nil)
        {
            
            [self presentViewController:editDocInfo animated:TRUE completion:nil];
        }
    
}
@end
