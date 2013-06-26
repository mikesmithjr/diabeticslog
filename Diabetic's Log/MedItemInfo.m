//
//  MedItemInfo.m
//  Diabetic's Log
//
//  Created by Michael Smith on 6/21/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import "MedItemInfo.h"

@implementation MedItemInfo
@synthesize medName, medTimes;

-(id)initMedItemInfo: (NSString*)name medTimes:(NSString*)time
{
    if ((self = [super init]))
    {
        medName = name;
        medTimes = time;
    }
    return self;
}

@end
