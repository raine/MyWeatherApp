//
//  WeatherLocation.m
//  MyWeatherApp
//
//  Created by Raine Virta on 5.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import "WeatherLocation.h"

@implementation WeatherLocation

- (id)initWithLocation:(NSString *)location {
    if (self = [self init]) {
        _name = location;
    }

    return self;
}

- (id)init {
    if (self = [super init]) {
        _name = @"Helsinki";
        _temperature = 12.4;
    }

    return self;
}


@end
