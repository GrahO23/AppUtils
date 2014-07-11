//
//  ConfigTests.m
//  AppUtils
//
//  Created by groldfie on 11/07/2014.
//  Copyright (c) 2014 Graham Oldfield. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"

#import "AppConfig.h"

SpecBegin(ConfigTests)


describe(@"Config Test", ^{
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
	
	it(@"init", ^{
		AppConfig* config = [AppConfig sharedInstance];
		expect(config).toNot.beNil();
	});

	it(@"save", ^{
		[AppConfig setObject:@"foo" forKey:@"foo"];
		[AppConfig setObject:@"bar" forKey:@"bar"];
		expect([((NSString*)[AppConfig objectForKey:@"foo"]) isEqualToString:@"foo"]).to.beTruthy();
		expect([((NSString*)[AppConfig objectForKey:@"bar"]) isEqualToString:@"bar"]).to.beTruthy();
	});
	
	it(@"restore", ^{
		expect([((NSString*)[AppConfig objectForKey:@"foo"]) isEqualToString:@"foo"]).to.beTruthy();
		expect([((NSString*)[AppConfig objectForKey:@"bar"]) isEqualToString:@"bar"]).to.beTruthy();
	});
	
	it(@"reset", ^{
		[AppConfig removeAllObjects];
		expect([((NSString*)[AppConfig objectForKey:@"foo"]) isEqualToString:@"foo"]).to.beFalsy();
		expect([((NSString*)[AppConfig objectForKey:@"bar"]) isEqualToString:@"bar"]).to.beFalsy();
	});
	
});



SpecEnd


