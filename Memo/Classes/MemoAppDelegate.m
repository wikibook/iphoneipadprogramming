//
//  MemoAppDelegate.m
//  Memo
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import "MemoAppDelegate.h"
#import "ListViewController.h"

@implementation MemoAppDelegate

@synthesize window;
@synthesize mainView;
@synthesize lvc;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

	lvc = [[ListViewController alloc] initWithNibName:@"ListView" bundle:nil];
	[self.mainView addSubview: [lvc view]];	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
	[lvc release];
	[mainView release];
    [window release];
    [super dealloc];
}


@end
