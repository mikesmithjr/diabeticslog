//
//  EditMedViewController.m
//  Diabetic's Log
//
//  Created by Michael Smith on 6/11/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import "EditMedViewController.h"
#import "MedItemInfo.h"

@interface EditMedViewController ()

@end

@implementation EditMedViewController
@synthesize medItemDetail;

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
    // Do any additional setup after loading the view from its nib.

}

-(void)viewWillAppear:(BOOL)animated
{
    if (self.medItemDetail != nil)
    {
        medName.text = self.medItemDetail.medName;
        medTimes.text = self.medItemDetail.medTimes;
        
    }
}

-(IBAction)onSaveClick:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
