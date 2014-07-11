//
//  UtilsTest.m
//  AppUtils
//
//  Created by groldfie on 11/07/2014.
//  Copyright (c) 2014 Graham Oldfield. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "Utils.h"
#import "Config.h"

SpecBegin(UtilsTest)


describe(@"Utils Test", ^{
	sharedExamplesFor(@"another shared behavior", ^(NSDictionary *data) {
		// Locally defined shared examples can override global shared examples within its scope.
	});
	
	beforeAll(^{
		// This is run once and only once before all of the examples
		// in this group and before any beforeEach blocks.
	});
	
	beforeEach(^{
		// This is run before each example.
	});
	
	it(@"docsPath", ^{
		expect([Utils docsPath]).toNot.beNil();
	});
	
	it(@"pretty Print", ^{
		expect([Utils prettyPrint:[NSDate date]]).toNot.beNil();
	});
	
	it(@"Time plus 1 hour", ^{
		NSDate* current = [NSDate date];
		NSDate* newDate = [Utils hoursMinutesFromDate:current operandHours:1 operandMins:0];
		NSTimeInterval seconds = 1 * 60 * 60;
		NSDate *verifyTime = [current dateByAddingTimeInterval:seconds];
		expect([newDate isEqualToDate:verifyTime]).to.beTruthy();
	});
	
	it(@"Time plus 5 hour", ^{
		NSDate* current = [NSDate date];
		NSDate* newDate = [Utils hoursMinutesFromDate:current operandHours:5 operandMins:0];
		NSTimeInterval secondsInNHours = (5 * 60 * 60);
		NSDate *verifyTime = [current dateByAddingTimeInterval:secondsInNHours];
		expect([newDate isEqualToDate:verifyTime]).to.beTruthy();
	});
	
	it(@"Time minus 5 hour", ^{
		NSDate* current = [NSDate date];
		NSDate* newDate = [Utils hoursMinutesFromDate:current operandHours:-5 operandMins:0];
		NSTimeInterval secondsInNHours = (-5 * 60 * 60);
		NSDate *verifyTime = [current dateByAddingTimeInterval:secondsInNHours];
		expect([newDate isEqualToDate:verifyTime]).to.beTruthy();
	});
	
	it(@"Time plus 10 30 mins hour", ^{
		NSDate* current = [NSDate date];
		NSDate* newDate = [Utils hoursMinutesFromDate:current operandHours:10 operandMins:30];
		NSTimeInterval secondsInNHours = (10 * 60 * 60);
		secondsInNHours += (30 * 60);
		NSDate *verifyTime = [current dateByAddingTimeInterval:secondsInNHours];
		expect([newDate isEqualToDate:verifyTime]).to.beTruthy();
	});
	
	it(@"Time minus 10 30 mins hour", ^{
		NSDate* current = [NSDate date];
		NSDate* newDate = [Utils hoursMinutesFromDate:current operandHours:-10 operandMins:-30];
		NSTimeInterval secondsInNHours = (-10 * 60 * 60);
		secondsInNHours += (-30 * 60);
		NSDate *verifyTime = [current dateByAddingTimeInterval:secondsInNHours];
		expect([newDate isEqualToDate:verifyTime]).to.beTruthy();
	});
	
	it(@"Time plus 1 day", ^{
		NSDate* current = [NSDate date];
		NSDate* newDate = [Utils daysFromDate:current operandDays:1];
		NSTimeInterval seconds = 1 * 60 * 60 * 24;
		NSDate *verifyTime = [current dateByAddingTimeInterval:seconds];
		expect([newDate isEqualToDate:verifyTime]).to.beTruthy();
	});
	
	it(@"Time plus 5 day", ^{
		NSDate* current = [NSDate date];
		NSDate* newDate = [Utils daysFromDate:current operandDays:5];
		NSTimeInterval secondsInNHours = (5 * 60 * 60 * 24);
		NSDate *verifyTime = [current dateByAddingTimeInterval:secondsInNHours];
		expect([newDate isEqualToDate:verifyTime]).to.beTruthy();
	});
	
	it(@"Time minus 1 day", ^{
		NSDate* current = [NSDate date];
		NSDate* newDate = [Utils daysFromDate:current operandDays:-1];
		NSTimeInterval seconds = -1 * 60 * 60 * 24;
		NSDate *verifyTime = [current dateByAddingTimeInterval:seconds];
		expect([newDate isEqualToDate:verifyTime]).to.beTruthy();
	});
	
	it(@"Time minus 5 day", ^{
		NSDate* current = [NSDate date];
		NSDate* newDate = [Utils daysFromDate:current operandDays:-5];
		NSTimeInterval secondsInNHours = (-5 * 60 * 60 * 24);
		NSDate *verifyTime = [current dateByAddingTimeInterval:secondsInNHours];
		expect([newDate isEqualToDate:verifyTime]).to.beTruthy();
	});
	
});



SpecEnd


