//
//  WeatherLocation.m
//  MyWeatherApp
//
//  Created by Raine Virta on 5.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import "WeatherLocation.h"

@implementation WeatherLocation

- (id)initWithName:(NSString *)name {
    if (self = [self init]) {
        _name = name;
    }

    return self;
}

- (id)init {
    if (self = [super init]) {
        _name = @"Helsinki";
    }

    return self;
}

+ (NSSet *)keyPathsForValuesAffectingFahrenheit {
    return [NSSet setWithObject:@"celsius"];
}

+ (NSSet *)keyPathsForValuesAffectingKelvin {
    return [NSSet setWithObject:@"celsius"];
}

- (void)setKelvin:(double)degreesK {
    [self setCelsius:degreesK - 273.15];
}

- (double)kelvin {
    return [self celsius] + 273.15;
}

- (void)setFahrenheit:(double)degreesF {
    [self setCelsius:(degreesF - 32) / 1.8];
}

- (double)fahrenheit {
    return [self celsius] * 1.8 + 32;
}

@end
