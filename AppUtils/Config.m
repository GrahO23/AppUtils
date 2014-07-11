//
//  Config.m
//  AppUtils
//
//  Created by groldfie on 11/07/2014.
//  Copyright (c) 2014 Graham Oldfield. All rights reserved.
//

#import "Config.h"
#import "Utils.h"

static Config *_sharedInstance = nil;

@interface Config()<NSCoding>
@property (strong ,nonatomic) NSMutableDictionary* configDictionary;

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

+(NSString*)configPath{
	return [[Utils docsPath] stringByAppendingPathComponent:@"config.store"];
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
		if(self.configDictionary == nil){
			self.configDictionary = [[NSMutableDictionary alloc]init];
		}
	}
	return self;
}

+(void)removeObjectforKey:(NSString*)aKey{
	[[Config sharedInstance].configDictionary removeObjectForKey:aKey];
	[Config save];
}

+(void)removeAllObjects{
	[[Config sharedInstance].configDictionary removeAllObjects];
	[Config save];
}

+(void)setObject:(id)anObject forKey:(NSString*)aKey{
	Config* conf = [Config sharedInstance];
	[conf.configDictionary  setObject:anObject forKey:aKey];
	[Config save];
}

+(instancetype)objectForKey:(NSString*)key{
	Config* conf = [Config sharedInstance];
	return  [conf.configDictionary objectForKey:key];
}

+(void)save{
	Boolean saved = [NSKeyedArchiver archiveRootObject:[Config sharedInstance] toFile:[Config configPath]];
	NSLog(@"Config save: %d",saved);
}



@end
