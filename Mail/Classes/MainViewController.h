//
//  MainViewController.h
//  Mail
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h> 

@interface MainViewController : UIViewController <MFMailComposeViewControllerDelegate> {

	UIButton* newMailBtn;
	UIButton* mailBtn;

	NSString* titleString;
	NSString* toString;
	NSString* contentString;

}

@property (nonatomic, retain) IBOutlet UIButton* newMailBtn;
@property (nonatomic, retain) IBOutlet UIButton* mailBtn;
@property (nonatomic, retain) NSString* titleString;
@property (nonatomic, retain) NSString* toString;
@property (nonatomic, retain) NSString* contentString;

- (void) setMailInfo;
- (IBAction) sendMail;
- (IBAction) sendMailWithOtherWay;

@end
