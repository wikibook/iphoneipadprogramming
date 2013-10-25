//
//  MyPlayerAppDelegate.m
//  MyPlayer
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import "MyPlayerAppDelegate.h"
#import "MainViewController.h"

@implementation MyPlayerAppDelegate

@synthesize mv;
@synthesize mainView;
@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

	mv = [[MainViewController alloc] initWithNibName:@"MainView" bundle: nil];
	[mainView addSubview: [mv view]];
    [window makeKeyAndVisible];
	return YES;
}


- (void)dealloc {
    [window release];
	[mainView release];
    [super dealloc];
}


@end
