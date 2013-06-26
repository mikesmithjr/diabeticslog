//
//  LogItemInfo.m
//  Diabetic's Log
//
//  Created by Michael Smith on 6/20/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import "LogItemInfo.h"

@implementation LogItemInfo
@synthesize currentDate, currentTime, reason, reading;

-(id)initLogItemInfo: (NSString*)date currentTime:(NSString*)time reason:(NSString*)reasons reading:(NSString*)readings
{
    if ((self = [super init]))
    {
        currentDate = date;
        currentTime = time;
        reason = reasons;
        reading = readings;
    }
    return self;
}

@end
