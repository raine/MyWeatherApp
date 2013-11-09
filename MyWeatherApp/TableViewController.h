//
//  TableViewController.h
//  MyWeatherApp
//
//  Created by Raine Virta on 5.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherDelegate.h"

@interface TableViewController : NSObject <NSTableViewDataSource, WeatherDelegate>

@end
