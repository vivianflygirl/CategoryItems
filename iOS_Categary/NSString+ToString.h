//
//  NSString+ToString.h
//  ZTEWeiJin
//
//  Created by jajeo on 15/7/8.
//  Copyright (c) 2015年 jajeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ToString)


+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;

+(NSString *) jsonStringWithArray:(NSArray *)array;

+(NSString *) jsonStringWithString:(NSString *) string;

+(NSString *) jsonStringWithObject:(id) object;

@end
