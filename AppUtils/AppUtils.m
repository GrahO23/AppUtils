//
//  Utils.m
//  AppUtils
//
//  Created by groldfie on 11/07/2014.
//  Copyright (c) 2014 Graham Oldfield. All rights reserved.
//

#import "AppUtils.h"
#import "UIAlertView+Blocks.h"

@implementation AppUtils

+(NSString*)docsPath{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	return [paths firstObject];
}

+(NSString*)prettyPrint:(NSDate*)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
	[dateFormatter setDateFormat:@"YYYY-MM-dd'T'HH:mm:ss.SSS'Z'"];
    return [dateFormatter stringFromDate:date];
}

+(NSString*)dateToISO8601:(NSDate*)date{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
	[dateFormatter setDateFormat:@"YYYY-MM-dd'T'HH:mm:ss.SSS'Z'"];
    return [dateFormatter stringFromDate:date];
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


+(NSDate *)beginningOfDay:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSDayCalendarUnit| NSMonthCalendarUnit | NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:date];
	
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
	
    return [cal dateFromComponents:components];
	
}

+(NSDate *)endOfDay:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(  NSDayCalendarUnit| NSMonthCalendarUnit | NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:date];
	
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
	
    return [cal dateFromComponents:components];
	
}

+(void)showAlert:(NSString*)title withDescrip:(NSString*)body{
	dispatch_async(dispatch_get_main_queue(),
				   ^{
					   RIButtonItem *cancelItem = [RIButtonItem itemWithLabel:@"OK" action:^{
					   }];
					   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
																		   message:body
																  cancelButtonItem:cancelItem
																  otherButtonItems: nil];
					   [alertView show];
				   });
}

+(void)openExternalURL:(NSString*)url{
	dispatch_async(dispatch_get_main_queue(), ^{
		NSURL* _url = [NSURL URLWithString:url];
		BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:_url];
		if(canOpen){
			[[UIApplication sharedApplication] openURL:_url];
		}
		else {
			NSLog(@"Error no app to handle: %@ " , url);
			[AppUtils showAlert:@"Error" withDescrip:	[NSString stringWithFormat:@"Error no app to handle\n: %@ " , url]];
			NSLog(@"Todo fall back on web url");
		}
	});
}

+(void)raiseLocalNotification:(NSString*)title withContext:(NSDictionary*)context{
	NSLog(@"raiseLocalNotification: %@",title);
	UILocalNotification *notification = [[UILocalNotification alloc]init];
	notification.repeatInterval = NSDayCalendarUnit;
	[notification setAlertBody: title];
	notification.hasAction = YES;
	notification.soundName = UILocalNotificationDefaultSoundName;
	[notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:1]];
	[notification setTimeZone:[NSTimeZone  defaultTimeZone]];
	[notification setUserInfo:context];
	[[UIApplication sharedApplication]setScheduledLocalNotifications:[NSArray arrayWithObject:notification]];
}


NSString *charactersToEscape = @"!*'();:@&=+$,/?%#[]\" ";
NSCharacterSet *allowedCharacters = NULL;

+(NSString *)encodeUriComponent:(NSString *)string {
    if(allowedCharacters == NULL) {
        allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    }
    return [string stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
}

+(NSString *)decodeUriComponent:(NSString *)string {
    return [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+(NSInteger)getRandomNumberBetween:(NSInteger)min maxNumber:(NSInteger)max
{
    return min + arc4random() % (max - min + 1);
}

@end
