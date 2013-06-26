//
//  EditMedViewController.h
//  Diabetic's Log
//
//  Created by Michael Smith on 6/11/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MedItemInfo.h"

@interface EditMedViewController : UIViewController
{
    IBOutlet UITextField *medName;
    IBOutlet UITextField *medTimes;
    
}

-(IBAction)onSaveClick:(id)sender;


@property (nonatomic, strong) MedItemInfo *medItemDetail;
@end
