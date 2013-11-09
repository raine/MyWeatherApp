//
//  WeatherAPIClient.m
//  MyWeatherApp
//
//  Created by Raine Virta on 9.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import "WeatherAPIClient.h"

static NSString * const WeatherAPIBaseURL = @"http://localhost:3000";

@implementation WeatherAPIClient

+ (instancetype)sharedClient {
    static WeatherAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[WeatherAPIClient alloc] initWithBaseURL:[NSURL URLWithString:WeatherAPIBaseURL]];
        [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
    });

    return _sharedClient;
}

@end