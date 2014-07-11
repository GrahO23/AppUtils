//
//  Utils.m
//  AppUtils
//
//  Created by groldfie on 11/07/2014.
//  Copyright (c) 2014 Graham Oldfield. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(NSString*)prettyPrint:(NSDate*)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:date];
}

+(NSDate*)daysFromDate:(NSDate*)startDate operandDays:(NSInteger)operandDays{
	NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
	[dateComponents setDay:operandDays];
	return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:startDate options:0];
}

+(NSDate*)hoursMinutesFromDate:(NSDate*)startDate operandHours:(NSInteger)operandHours operandMins:(NSInteger)operandMins{
	NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
	[dateComponents setHour:operandHours];
	[dateComponents setMinute:operandMins];
	return [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:startDate options:0];
}

@end
