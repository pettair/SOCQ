//
//  SOCQ+NSDictionary.m
//  SOCQ
//
//  Created by Adam Burkepile on 2/8/12.
//  Copyright (c) 2012 Adam Burkepile. All rights reserved.
//

#import "SOCQ+NSDictionary.h"

@implementation NSDictionary (SOCQ)

- (NSDictionary*)where:(BOOL(^)(id key, id value))check {
    NSMutableDictionary* retDictionary = [NSMutableDictionary new];
    
    for (id key in [self allKeys]) {
        if (check(key, [self objectForKey:key])) {
            [retDictionary setObject:[self objectForKey:key] forKey:key];
        }
    }
    
    return retDictionary;
}

- (BOOL)any:(BOOL(^)(id key, id value))check {
    for (id key in [self allKeys]) {
        if (check(key, [self objectForKey:key])) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)all:(BOOL(^)(id key, id value))check {
    for (id key in [self allKeys]) {
        if (!check(key, [self objectForKey:key])) {
            return NO;
        }
    }
    
    return YES;
}

@end
