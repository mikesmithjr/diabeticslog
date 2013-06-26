//
//  MedEntryViewController.h
//  Diabetic's Log
//
//  Created by Michael Smith on 6/11/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedEntryViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *medName;
    IBOutlet UITextField *medTime;
    NSString *fullPath;
    NSMutableDictionary *medItemList;
    NSArray *medItems;
}

-(IBAction)onSaveClick:(id)sender;
@end
