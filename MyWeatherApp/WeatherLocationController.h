//
//  WeatherLocationController.h
//  MyWeatherApp
//
//  Created by Raine Virta on 9.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherLocation.h"

@interface WeatherLocationController : NSObject

@property (nonatomic, strong) NSMutableArray* locations;

- (WeatherLocation *)addLocationWithName:(NSString *)name;
- (void)updateLocation:(WeatherLocation *)location;

@end
