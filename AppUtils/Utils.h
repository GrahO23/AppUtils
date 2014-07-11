//
//  Utils.h
//  AppUtils
//
//  Created by groldfie on 11/07/2014.
//  Copyright (c) 2014 Graham Oldfield. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+(NSString*)docsPath;
+(NSString*)prettyPrint:(NSDate*)date;
/*
 * +/- days from start date
 */

+(NSDate*)hoursMinutesFromDate:(NSDate*)startDate operandHours:(NSInteger)operandHours operandMins:(NSInteger)operandMins;
+(NSDate*)daysFromDate:(NSDate*)startDate operandDays:(NSInteger)operandDays;

@end
