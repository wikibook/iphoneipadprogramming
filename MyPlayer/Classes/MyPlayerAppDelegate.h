//
//  MyPlayerAppDelegate.h
//  MyPlayer
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface MyPlayerAppDelegate : NSObject <UIApplicationDelegate> {

	MainViewController* mv;
    UIWindow *window;
	UIView* mainView;
	
}

@property (nonatomic, retain) MainViewController* mv;
@property (nonatomic, retain) IBOutlet UIView* mainView;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

