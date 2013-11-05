//
//  AppDelegate.m
//  MyWeatherApp
//
//  Created by Raine Virta on 5.11.2013.
//  Copyright (c) 2013 Raine Virta. All rights reserved.
//

#import "AppDelegate.h"
#import "MyWindowController.h"

@implementation AppDelegate {
    MyWindowController *myWindowController;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    myWindowController = [[MyWindowController alloc] init];
    [[myWindowController window] makeKeyAndOrderFront:myWindowController];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

@end
