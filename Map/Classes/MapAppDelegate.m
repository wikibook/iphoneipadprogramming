//
//  MapAppDelegate.m
//  Map
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import "MapAppDelegate.h"
#import "MainViewController.h"

@implementation MapAppDelegate

@synthesize window;
@synthesize mainView;
@synthesize mvc;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

	mvc = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	[self.mainView addSubview:[mvc view]]; 
	[window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
	[mvc release];
    [window release];
    [super dealloc];
}

@end

