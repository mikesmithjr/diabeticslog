//
//  SettingsViewController.h
//  Diabetic's Log
//
//  Created by Michael Smith on 3/27/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
{
    IBOutlet UIButton *editPers;
    IBOutlet UIButton *editDoc;
}

-(IBAction)onEditPersonalClick:(id)sender;
-(IBAction)onEditDocClick:(id)sender;
@end
