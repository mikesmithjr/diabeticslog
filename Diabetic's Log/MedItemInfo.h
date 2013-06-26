//
//  MedItemInfo.h
//  Diabetic's Log
//
//  Created by Michael Smith on 6/21/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MedItemInfo : NSObject
{
    NSString *medName;
    NSString *medTimes;
}
-(id)initMedItemInfo: (NSString*)name medTimes:(NSString*)time;

@property(nonatomic, readonly)NSString *medName;
@property(nonatomic, readonly)NSString *medTimes;
@end
