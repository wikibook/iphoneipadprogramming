//
//  MailAppDelegate.m
//  Mail
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import "MailAppDelegate.h"
#import "MainViewController.h"

@implementation MailAppDelegate

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
