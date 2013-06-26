//
//  LogItemListViewController.h
//  Diabetic's Log
//
//  Created by Michael Smith on 3/27/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogItemListViewController : UIViewController <UITableViewDelegate>

{
    IBOutlet UITableView *table;
    NSMutableArray *logItemList;
    NSArray *logItems;
    NSMutableArray *logItemsArray;
    NSDictionary *logItemsDictionary;
    
}

@end
