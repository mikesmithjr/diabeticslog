//
//  LogItemInfo.h
//  Diabetic's Log
//
//  Created by Michael Smith on 6/20/13.
//  Copyright (c) 2013 Michael Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogItemInfo : NSObject
{
    NSString *currentDate;
    NSString *currentTime;
    NSString *reason;
    NSString *reading;
}
-(id)initLogItemInfo: (NSString*)date currentTime:(NSString*)time reason:(NSString*)reasons reading:(NSString*)readings;
@property(nonatomic, readonly)NSString *currentDate;
@property(nonatomic, readonly)NSString *currentTime;
@property(nonatomic, readonly)NSString *reason;
@property(nonatomic, readonly)NSString *reading;
@end
