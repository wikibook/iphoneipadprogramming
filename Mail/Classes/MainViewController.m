    //
//  MainViewController.m
//  Mail
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

@synthesize mailBtn;
@synthesize titleString;
@synthesize toString;
@synthesize contentString;
@synthesize newMailBtn;

- (void)viewDidLoad {

	[self setMailInfo];
    [super viewDidLoad];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {

    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
			interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown
			);
}

- (void) setMailInfo {

	toString = @"ask@stcocoa.com";
	titleString = @"제목이 들어갑니다.";
	contentString = @"내용이 들어갑니다.";
}

- (IBAction) sendMail {
	
	NSString *mailtoStr = [[NSString stringWithFormat:@"mailto: %@ ?subject= %@ &body= %@", toString, titleString, contentString]
		stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailtoStr]]; 
	
}

- (IBAction) sendMailWithOtherWay {
	
	MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
	
	controller.mailComposeDelegate = self;
	
	NSArray *toRecipients = [NSArray arrayWithObjects: @"ask@stcocoa.com", @"whatsup@stcocoa.com", nil]; 
	[controller setToRecipients: toRecipients];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"myImage" ofType:@"png"];
    NSData *myData = [NSData dataWithContentsOfFile:path];
    [controller addAttachmentData:myData mimeType:@"image/png" fileName:@"HeyDownload.png"];
	
	[controller setSubject:@"안녕하세요 ^^"];
	[controller setMessageBody: @"날씨도 좋은데 요즘 어떻게 지내세요. \n 저는 잘지내고 있어요. " isHTML:NO];
	
	[self presentModalViewController:controller animated:YES];
	[controller release];	
	
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self becomeFirstResponder];
	[self dismissModalViewControllerAnimated:YES];
	
} 


- (void)didReceiveMemoryWarning {
  
    [super didReceiveMemoryWarning];
	[newMailBtn release];
	[mailBtn release];
	
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.newMailBtn = nil;
	self.mailBtn = nil;
	
}

- (void)dealloc {
	[newMailBtn release];
	[mailBtn release];
    [super dealloc];
}

@end
