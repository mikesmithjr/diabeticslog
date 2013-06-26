//
//  EditLogEntryViewController.m
//  Diabetic's Log
//
//  Created by Michael Smith on 3/28/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import "EditLogEntryViewController.h"
#import "LogItemInfo.h"

@interface EditLogEntryViewController ()

@end

@implementation EditLogEntryViewController

@synthesize logItemDetail;

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
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    if (self.logItemDetail != nil)
    {
        date.text = self.logItemDetail.currentDate;
        time.text = self.logItemDetail.currentTime;
        reason.text = self.logItemDetail.reason;
        reading.text = self.logItemDetail.reading;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onEditClick:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
