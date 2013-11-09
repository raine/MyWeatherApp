//
//  TableViewController.m
//  MyWeatherApp
//
//  Created by Raine Virta on 5.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import "TableViewController.h"
#import "WeatherLocation.h"
#import "Weather.h"

@interface TableViewController () {
    IBOutlet NSTableView *tableView;
    NSMutableArray *list;
}
@end

@implementation TableViewController

- (id)init
{
    if (self = [super init]) {
        list = [[NSMutableArray alloc] init];
        [self addLocation];

        Weather *weather = [[Weather alloc] init];
        //        [weather getWeatherWithDelegate:self location:@"Helsinki"];
        [weather getWeatherWithLocation:@"Helsinki" success:^(id JSON) {
            NSDictionary *jsonDict = (NSDictionary *) JSON;
        } failure:^(NSError *error, id response) {
            // Do something eventually
        }];
    }

    return self;
}

- (void)weather:(Weather *)weather finishedWithResults:(NSDictionary *)results
{
    NSLog(@"got weather results %@", results);
}

- (void)addLocation
{
    WeatherLocation *weatherLocation = [[WeatherLocation alloc] initWithLocation:@"Kuopio"];
    [list addObject:weatherLocation];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [list count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)aRow
{
    id result = nil;

    NSObject *object = [list objectAtIndex:aRow];
    NSString *identifier = [aTableColumn identifier];
    id value = [object valueForKey:identifier];

    if ([identifier isEqualToString:@"temperature"]) {
        result = [NSString stringWithFormat:@"%@°C", value];
    } else {
        result = value;
    }

    return result;
}

- (void)tableView:(NSTableView *)aTableView
   setObjectValue:(id)anObject
   forTableColumn:(NSTableColumn *)aTableColumn
              row:(NSInteger)aRow
{
    // Identifier should always be the name, but just to make it clear
    NSString *identifier = [aTableColumn identifier];
    if ([identifier isEqualToString:@"name"]) {
        NSObject *object = [list objectAtIndex:aRow];
        [object setValue:anObject forKey:identifier];
    }
}

- (IBAction)add:(id)sender
{
    [self addLocation];
    [tableView reloadData];
}

- (IBAction)remove:(id)sender
{
    NSInteger row = [tableView selectedRow];
    if (row > -1) {
        [list removeObjectAtIndex:row];
        [tableView reloadData];
    }
}

@end
