//
//  ContentViewController.h
//  Memo
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate> {
	int memoNumber;
	UITextView* myTextView;
	UITextField* myTextField;
	UIButton* myBackBtn;
	NSMutableDictionary* plistData;
	NSMutableArray* titles;
	NSMutableArray* contents;
	NSString* myTitle;
	NSString* myContent;
	NSString* finalPath;
}

@property (nonatomic, assign) int memoNumber;
@property (nonatomic, retain) IBOutlet UITextView* myTextView;
@property (nonatomic, retain) IBOutlet UITextField* myTextField;
@property (nonatomic, retain) IBOutlet UIButton* myBackBtn;
@property (nonatomic, retain) NSMutableDictionary* plistData;
@property (nonatomic, retain) NSMutableArray* titles;
@property (nonatomic, retain) NSMutableArray* contents;
@property (nonatomic, retain) NSString* myTitle;
@property (nonatomic, retain) NSString* myContent;
@property (nonatomic, retain) NSString* finalPath;

- (void) setContentValue;
- (void) backBtnTouched:(id)sender;

@end
