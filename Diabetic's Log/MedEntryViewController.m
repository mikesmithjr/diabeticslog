//
//  MedEntryViewController.m
//  Diabetic's Log
//
//  Created by Michael Smith on 6/11/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import "MedEntryViewController.h"

@interface MedEntryViewController ()

@end

@implementation MedEntryViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if (documentsDirectory != nil)
    {
        fullPath = [[NSString alloc] initWithFormat:@"%@/%@", documentsDirectory, @"medItemList.plist"];
        NSLog(@"%@", fullPath);
        BOOL fileThere = [[NSFileManager defaultManager] fileExistsAtPath:fullPath];
        if (fileThere)
        {
            
            medItemList = [[NSMutableDictionary alloc] initWithContentsOfFile:fullPath];
            NSLog(@"%@", [medItemList description]);
            
            
        }else{
            fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"medItemList.plist"]];
            medItemList = [[NSMutableDictionary alloc]init];
        }
        
    }
}



- (void)keyboardWillShow:(NSNotification *)notification
{
    
    [self.view setFrame:CGRectMake(0, -20, 320, 460)];
    
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
        
    }
    return NO;
}

-(IBAction)onSaveClick:(id)sender
{
    BOOL fileThere = [[NSFileManager defaultManager] fileExistsAtPath:fullPath];
    if (fileThere)
    {
        NSMutableArray *medItem = [[NSMutableArray alloc] initWithContentsOfFile:fullPath];
        NSMutableDictionary *items = [[NSMutableDictionary alloc]init];
        
        [items setObject:[NSString stringWithFormat:@"%@", medName.text] forKey:@"medName"];
        [items setObject:[NSString stringWithFormat:@"%@", medTime.text] forKey:@"medTime"];
        
        [medItem addObject:items];
        [medItem writeToFile:fullPath atomically:YES];
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        
        NSMutableDictionary *items = [[NSMutableDictionary alloc]init];
        
        [items setObject:[NSString stringWithFormat:@"%@", medName.text] forKey:@"medName"];
        [items setObject:[NSString stringWithFormat:@"%@", medTime.text] forKey:@"medTime"];
        
        NSMutableArray *medItem = [[NSMutableArray alloc] initWithObjects:items, nil];
        [medItem writeToFile:fullPath atomically:YES];
        [self dismissViewControllerAnimated:true completion:nil];
    }
    //NSLog(@"Saving File");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
