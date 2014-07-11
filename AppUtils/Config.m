//
//  Config.m
//  AppUtils
//
//  Created by groldfie on 11/07/2014.
//  Copyright (c) 2014 Graham Oldfield. All rights reserved.
//

#import "Config.h"

static Config *_sharedInstance = nil;

@interface Config()<NSCoding>
@property NSMutableDictionary* configDictionary;

@end

@implementation Config

+ (instancetype) sharedInstance{
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
		NSData * data = [NSData dataWithContentsOfFile:[Config configPath]];
		if(data!=nil){
			_sharedInstance = [NSKeyedUnarchiver unarchiveObjectWithData:data];
		}
		else{
			_sharedInstance = [Config alloc];
		}
		
    });
    return _sharedInstance;
}


+(NSString*)docsPath{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	return [paths firstObject];
}

+(NSString*)configPath{
	return [[Config docsPath] stringByAppendingPathComponent:@"config.store"];
}


- (void)encodeWithCoder:(NSCoder *)aCoder{
	[aCoder encodeObject:self.configDictionary forKey:@"configDictionary"];
	
}

-(id)init{
	self = [super init];
	if(self){
		self.configDictionary = [NSMutableDictionary alloc];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
	self = [super init];
	if(self){
		self.configDictionary = [aDecoder decodeObjectForKey:@"configDictionary"];
	}
	return self;
}


+(void)save{

}



@end
