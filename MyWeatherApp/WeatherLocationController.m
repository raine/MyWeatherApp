//
//  WeatherLocationController.m
//  MyWeatherApp
//
//  Created by Raine Virta on 9.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import "WeatherLocationController.h"
#import "WeatherLocation.h"
#import "Weather.h"

@interface WeatherLocationController () {
    Weather *_weather;
}
@end

@implementation WeatherLocationController

- (id)init
{
    if (self = [super init]) {
        _locations = [[NSMutableArray alloc] init];
        _weather = [[Weather alloc] init];
    }

    return self;
}

- (WeatherLocation *)addLocationWithName:(NSString *)name
{
    WeatherLocation *location = [[WeatherLocation alloc] initWithName:name];
    [self.locations addObject:location];
    [self updateLocation:location];

    return location;
}

- (void)updateLocation:(WeatherLocation *)location
{
    __block WeatherLocation *loc = location;
    [_weather getWeatherWithLocation:location.name success:^(id JSON) {
        NSNumber *temp    = [JSON valueForKeyPath:@"main.temp"];
        NSString *name    = [JSON valueForKeyPath:@"name"];
        NSString *country = [JSON valueForKeyPath:@"sys.country"];

        if (name) {
            loc.name = name;
        }

        if (temp) {
            [loc setKelvin:[temp doubleValue]];
        }

        if (country) {
            loc.country = country;
        }
    } failure:^(NSError *error, id response) {
        // Do something eventually
    }];
}

@end