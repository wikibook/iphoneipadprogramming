//
//  MemoAppDelegate.h
//  Memo
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListViewController;

@interface MemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIView* mainView;
	ListViewController* lvc;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIView *mainView;
@property (nonatomic, retain) ListViewController *lvc;

@end

