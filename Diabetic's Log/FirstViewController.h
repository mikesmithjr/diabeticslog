//
//  FirstViewController.h
//  Diabetic's Log
//
//  Created by Michael Smith on 3/27/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

{
    IBOutlet UIButton *logEntry;
    IBOutlet UIButton *logList;
}

-(IBAction)onLogEntryClick:(id)sender;
-(IBAction)onLogListClick:(id)sender;
@end
