//
//  LogEntryViewController.m
//  Diabetic's Log
//
//  Created by Michael Smith on 3/27/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import "LogEntryViewController.h"

@interface LogEntryViewController ()

@end

@implementation LogEntryViewController


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
    self.title = @"Log Entry";
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if (documentsDirectory != nil)
    {
        fullPath = [[NSString alloc] initWithFormat:@"%@/%@", documentsDirectory, @"logItemList.plist"];
        //NSLog(@"%@", fullPath);
        BOOL fileThere = [[NSFileManager defaultManager] fileExistsAtPath:fullPath];
        if (fileThere)
        {
            
            logItemList = [[NSMutableDictionary alloc] initWithContentsOfFile:fullPath];
            //NSLog(@"%@", [logItemList description]);
            
            
        }else{
            fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"logItemList.plist"]];
            logItemList = [[NSMutableDictionary alloc]init];
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
        NSMutableArray *logItem = [[NSMutableArray alloc] initWithContentsOfFile:fullPath];
        NSMutableDictionary *items = [[NSMutableDictionary alloc]init];
        
        [items setObject:[NSString stringWithFormat:@"%@", currentDate.text] forKey:@"currentDate"];
        [items setObject:[NSString stringWithFormat:@"%@", currentTime.text] forKey:@"currentTime"];
        [items setObject:[NSString stringWithFormat:@"%@", reason.text] forKey:@"reason"];
        [items setObject:[NSString stringWithFormat:@"%@", reading.text] forKey:@"reading"];
        [logItem addObject:items];
        [logItem writeToFile:fullPath atomically:YES];
        
        
    }else{
    
        NSMutableDictionary *items = [[NSMutableDictionary alloc]init];
        
        [items setObject:[NSString stringWithFormat:@"%@", currentDate.text] forKey:@"currentDate"];
        [items setObject:[NSString stringWithFormat:@"%@", currentTime.text] forKey:@"currentTime"];
        [items setObject:[NSString stringWithFormat:@"%@", reason.text] forKey:@"reason"];
        [items setObject:[NSString stringWithFormat:@"%@", reading.text] forKey:@"reading"];
        NSMutableArray *logItem = [[NSMutableArray alloc] initWithObjects:items, nil];
        [logItem writeToFile:fullPath atomically:YES];
    }
    //NSLog(@"Saving File");
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
