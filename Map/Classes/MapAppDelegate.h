//
//  MapAppDelegate.h
//  Map
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface MapAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIView* mainView;
	MainViewController* mvc;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIView* mainView;
@property (nonatomic, retain) MainViewController* mvc;

@end

