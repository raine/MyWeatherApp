//
//  WeatherDelegate.h
//  MyWeatherApp
//
//  Created by Raine Virta on 9.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@protocol WeatherDelegate <NSObject>

- (void)weather:(Weather *)weather finishedWithResults:(NSDictionary *)results;

@end