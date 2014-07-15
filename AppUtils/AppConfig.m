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

+ (id) sharedInstance{
    if(_sharedInstance==nil){
		NSData * data = [NSData dataWithContentsOfFile:[AppConfig configPath]];
		if(data!=nil){
			_sharedInstance = [NSKeyedUnarchiver unarchiveObjectWithData:data];
		}
		else{
			_sharedInstance = [[AppConfig alloc]init];
		}
		
    }
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
		self.configDictionary = [[NSMutableDictionary alloc]init];
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
	[((AppConfig*)[AppConfig sharedInstance]).configDictionary removeObjectForKey:aKey];
	[AppConfig save];
}

+(void)removeAllObjects{
	[((AppConfig*)[AppConfig sharedInstance]).configDictionary removeAllObjects];
	[AppConfig save];
}

+(void)setObject:(id)anObject forKey:(NSString*)aKey{
    [[AppConfig sharedInstance]_setObject:anObject forKey:aKey];
	[AppConfig save];
}

-(void)_setObject:(id)anObject forKey:(NSString*)aKey{
    return [self.configDictionary setObject:anObject forKey:aKey];
}

+(id)objectForKey:(NSString*)key{
	return  [[AppConfig sharedInstance] _objectForKey:key];
}

-(id)_objectForKey:(NSString*)key{
    return [self.configDictionary  objectForKey:key];
}

+(void)save{
	AppConfig* conf = [AppConfig sharedInstance];
	Boolean saved = [NSKeyedArchiver archiveRootObject:conf toFile:[AppConfig configPath]];
	NSLog(@"Config save: %d",saved);
}



@end
