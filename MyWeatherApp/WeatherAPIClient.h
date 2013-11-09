//
//  WeatherAPIClient.h
//  MyWeatherApp
//
//  Created by Raine Virta on 9.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface WeatherAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
