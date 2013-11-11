//
//  TableViewController.m
//  MyWeatherApp
//
//  Created by Raine Virta on 5.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import "TableViewController.h"
#import "WeatherLocationController.h"
#import "WeatherLocation.h"
#import "Weather.h"

@interface TableViewController () {
    IBOutlet NSTableView *tableView;
    WeatherLocationController *locationController;
}
@end

@implementation TableViewController

- (id)init
{
    if (self = [super init]) {
        locationController = [[WeatherLocationController alloc] init];
    }

    return self;
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [locationController.locations count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)aRow
{
    id result = nil;

    NSObject *object = [locationController.locations objectAtIndex:aRow];
    NSString *identifier = [aTableColumn identifier];

    if ([identifier isEqualToString:@"celsius"]) {
        NSNumber *temp = [object valueForKey:@"celsius"];
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.roundingIncrement = [NSNumber numberWithDouble:0.1];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        NSString *formattedTemp = [formatter stringFromNumber:temp];

        result = [NSString stringWithFormat:@"%@°C", formattedTemp];
    } else {
        result = [object valueForKey:identifier];
    }

    return result;
}

- (void)tableView:(NSTableView *)aTableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
    // Name is the only editable field so only `name` should ever be the identifier
    NSString *identifier = [aTableColumn identifier];
    if ([identifier isEqualToString:@"name"]) {
        WeatherLocation *location = [locationController.locations objectAtIndex:rowIndex];
        [location setValue:anObject forKey:identifier];
    }
}

- (IBAction)add:(id)sender
{
    WeatherLocation *location = [locationController addLocationWithName:@"Helsinki"];
    [self startObserving:location];
    [tableView reloadData];
}

- (IBAction)remove:(id)sender
{
    NSInteger row = [tableView selectedRow];
    if (row > -1) {
        WeatherLocation *location = [locationController.locations objectAtIndex:row];
        [self stopObserving:location];
        [locationController.locations removeObjectAtIndex:row];
        [tableView reloadData];
    }
}

- (void)startObserving:(WeatherLocation *)location
{
    [location addObserver:self
               forKeyPath:@"name"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];

    [location addObserver:self
               forKeyPath:@"celsius"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
}

- (void)stopObserving:(WeatherLocation *)location
{
    [location removeObserver:self forKeyPath:@"name" context:NULL];
    [location removeObserver:self forKeyPath:@"celsius" context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSUInteger rowIndex       = [locationController.locations indexOfObject:object];
    NSIndexSet *rowIndexes    = [NSIndexSet indexSetWithIndex:rowIndex];
    NSUInteger columnIndex    = [tableView columnWithIdentifier:keyPath];
    NSIndexSet *columnIndexes = [NSIndexSet indexSetWithIndex:columnIndex];

    [tableView reloadDataForRowIndexes:rowIndexes
                         columnIndexes:columnIndexes];
}

@end
