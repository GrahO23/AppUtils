//
//  Config.h
//  AppUtils
//
//  Created by groldfie on 11/07/2014.
//  Copyright (c) 2014 Graham Oldfield. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConfig : NSObject

+(instancetype) sharedInstance;
+(void)setObject:(id)anObject forKey:(NSString*)aKey;
+(instancetype)objectForKey:(NSString*)key;
+(void)removeObjectforKey:(NSString*)aKey;
+(void)removeAllObjects;
@end
