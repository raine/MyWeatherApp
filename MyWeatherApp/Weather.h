//
//  Weather.h
//  MyWeatherApp
//
//  Created by Raine Virta on 9.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

- (void)getWeatherWithDelegate:(id)delegate location:(NSString *)location;
- (void)getWeatherWithLocation:(NSString *)location
                       success:(void (^)(id JSON))success
                       failure:(void (^)(NSError *error, id response))failure;

@end
