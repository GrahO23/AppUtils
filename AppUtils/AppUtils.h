//
//  Utils.h
//  AppUtils
//
//  Created by groldfie on 11/07/2014.
//  Copyright (c) 2014 Graham Oldfield. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtils : NSObject

+(NSString*)docsPath;
+(NSString*)prettyPrint:(NSDate*)date;
+(NSString*)dateToISO8601:(NSDate*)date;
/*
 * +/- days from start date
 */

+(NSDate*)hoursMinutesFromDate:(NSDate*)startDate operandHours:(NSInteger)operandHours operandMins:(NSInteger)operandMins;
+(NSDate*)daysFromDate:(NSDate*)startDate operandDays:(NSInteger)operandDays;
//Guarenteed to be called on ui-thread
+(void)showAlert:(NSString*)title withDescrip:(NSString*)body;
+(void)openExternalURL:(NSString*)url;
+(void)raiseLocalNotification:(NSString*)title withContext:(NSDictionary*)context;
+(NSString *)encodeUriComponent:(NSString *)string;
+(NSString *)decodeUriComponent:(NSString *)string;
+(NSInteger)getRandomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max;


@end
