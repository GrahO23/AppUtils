//
//  Config.m
//  AppUtils
//
//  Created by groldfie on 11/07/2014.
//  Copyright (c) 2014 Graham Oldfield. All rights reserved.
//

#import "AppConfig.h"
#import "AppUtils.h"

static AppConfig *_sharedInstance = nil;

@interface AppConfig()<NSCoding>
@property (strong ,nonatomic) NSMutableDictionary* configDictionary;

@end

@implementation AppConfig

+ (instancetype) sharedInstance{
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
		NSData * data = [NSData dataWithContentsOfFile:[AppConfig configPath]];
		if(data!=nil){
			_sharedInstance = [NSKeyedUnarchiver unarchiveObjectWithData:data];
		}
		else{
			_sharedInstance = [AppConfig alloc];
		}
		
    });
    return _sharedInstance;
}

+(NSString*)configPath{
	return [[AppUtils docsPath] stringByAppendingPathComponent:@"config.store"];
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
	[[AppConfig sharedInstance].configDictionary removeObjectForKey:aKey];
	[AppConfig save];
}

+(void)removeAllObjects{
	[[AppConfig sharedInstance].configDictionary removeAllObjects];
	[AppConfig save];
}

+(void)setObject:(id)anObject forKey:(NSString*)aKey{
	AppConfig* conf = [AppConfig sharedInstance];
	[conf.configDictionary  setObject:anObject forKey:aKey];
	[AppConfig save];
}

+(id)objectForKey:(NSString*)key{
	AppConfig* conf = [AppConfig sharedInstance];
	return  [conf.configDictionary objectForKey:key];
}

+(void)save{
	Boolean saved = [NSKeyedArchiver archiveRootObject:[AppConfig sharedInstance] toFile:[AppConfig configPath]];
	NSLog(@"Config save: %d",saved);
}



@end
