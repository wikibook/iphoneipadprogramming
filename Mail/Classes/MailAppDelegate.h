//
//  MailAppDelegate.h
//  Mail
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface MailAppDelegate : NSObject <UIApplicationDelegate> {
	
	MainViewController* mv;
	UIView* mainView; 
	UIWindow *window;
}

@property (nonatomic, retain) MainViewController* mv;
@property (nonatomic, retain) IBOutlet UIView* mainView;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end