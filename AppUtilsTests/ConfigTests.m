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

#import "Config.h"

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
		Config* config = [Config sharedInstance];
		expect(config).toNot.beNil();
	});

	it(@"save", ^{
		[Config setObject:@"foo" forKey:@"foo"];
		[Config setObject:@"bar" forKey:@"bar"];
		expect([((NSString*)[Config objectForKey:@"foo"]) isEqualToString:@"foo"]).to.beTruthy();
		expect([((NSString*)[Config objectForKey:@"bar"]) isEqualToString:@"bar"]).to.beTruthy();
	});
	
	it(@"restore", ^{
		expect([((NSString*)[Config objectForKey:@"foo"]) isEqualToString:@"foo"]).to.beTruthy();
		expect([((NSString*)[Config objectForKey:@"bar"]) isEqualToString:@"bar"]).to.beTruthy();
	});
	
	it(@"reset", ^{
		[Config removeAllObjects];
		expect([((NSString*)[Config objectForKey:@"foo"]) isEqualToString:@"foo"]).to.beFalsy();
		expect([((NSString*)[Config objectForKey:@"bar"]) isEqualToString:@"bar"]).to.beFalsy();
	});
	
});



SpecEnd


