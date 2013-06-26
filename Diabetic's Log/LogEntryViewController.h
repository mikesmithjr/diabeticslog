//
//  LogEntryViewController.h
//  Diabetic's Log
//
//  Created by Michael Smith on 3/27/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogEntryViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *currentDate;
    IBOutlet UITextField *currentTime;
    IBOutlet UITextField *reason;
    IBOutlet UITextField *reading;
    NSString *fullPath;
    NSMutableDictionary *logItemList;
    NSArray *logItems;
}




-(IBAction)onSaveClick:(id)sender;

@end
