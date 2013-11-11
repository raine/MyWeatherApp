//
//  WeatherLocation.h
//  MyWeatherApp
//
//  Created by Raine Virta on 5.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherLocation : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *country;
@property double celsius;
@property double fahrenheit;
@property double kelvin;

- (id)initWithName:(NSString *)name;

@end
