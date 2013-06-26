//
//  MedListViewController.h
//  Diabetic's Log
//
//  Created by Michael Smith on 3/27/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedListViewController : UIViewController <UITableViewDelegate>

{
    NSMutableArray *medItemList;
    NSArray *medItems;
    NSMutableArray *medItemsArray;
    
    
    IBOutlet UITableView *table;
    
}

@end
