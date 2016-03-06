//
//  GVVideoService.m
//  GrapeVine
//
//  Created by Dru Lang on 3/6/16.
//  Copyright © 2016 Dru Lang. All rights reserved.
//

#import "GVVideoService.h"

@implementation GVVideoService

static GVVideoService *service = nil;


#pragma mark Singleton/Constructors

+ (instancetype)sharedService {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self alloc] init];
    });
    return service;
}

@end
