//
//  Weather.m
//  MyWeatherApp
//
//  Created by Raine Virta on 9.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import "Weather.h"
#import "AFNetworking.h"
#import "WeatherAPIClient.h"
#import "WeatherDelegate.h"

@implementation Weather

- (void)getWeatherWithDelegate:(id)delegate location:(NSString *)location
{
    [self getWeatherWithLocation:location success:^(id JSON) {
        if ([delegate respondsToSelector:@selector(weather:finishedWithResults:)]) {
            NSDictionary *jsonDict = (NSDictionary *) JSON;
            [delegate weather:self finishedWithResults:jsonDict];
        }
    } failure:^(NSError *error, id response) {
        // Do something eventually
    }];
}

- (void)getWeatherWithLocation:(NSString *)location success:(void (^)(id JSON))success failure:(void (^)(NSError *error, id response))failure
{
    NSString *urlString = @"/weather";
    NSDictionary *params = @{@"q": location};

    [[WeatherAPIClient sharedClient] GET:urlString parameters:(NSDictionary *)params success:^(NSURLSessionDataTask *task, id JSON) {
        success(JSON);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        failure(error, response);
    }];
}

@end
