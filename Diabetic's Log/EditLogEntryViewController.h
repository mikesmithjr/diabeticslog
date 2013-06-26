//
//  EditLogEntryViewController.h
//  Diabetic's Log
//
//  Created by Michael Smith on 3/28/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogItemInfo.h"

@interface EditLogEntryViewController : UIViewController

{
    IBOutlet UITextField *date;
    IBOutlet UITextField *time;
    IBOutlet UITextField *reason;
    IBOutlet UITextField *reading;
    IBOutlet UITextView *comments;
    
}



-(IBAction)onEditClick:(id)sender;



@property(nonatomic, strong) LogItemInfo *logItemDetail;

@end
