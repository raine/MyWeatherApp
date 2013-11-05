//
//  TableViewController.m
//  MyWeatherApp
//
//  Created by Raine Virta on 5.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController

- (id)init
{
    if(self = [super init]) {
        NSLog(@"%@", @"test");
    }

    return self;
}

- (IBAction)add:(id)sender
{
    NSLog(@"%@", @"add");
}

- (IBAction)remove:(id)sender
{
    NSLog(@"%@", @"remove");
}

@end
