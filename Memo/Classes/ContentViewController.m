//
//  ContentViewController.m
//  Memo
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa 2010. All rights reserved.
//

#import "ContentViewController.h"

#define plistName @"SavedData.plist"

@implementation ContentViewController

@synthesize memoNumber;
@synthesize myTextView;
@synthesize myTextField;
@synthesize myBackBtn;
@synthesize plistData;
@synthesize titles;
@synthesize contents;
@synthesize myTitle;
@synthesize myContent;
@synthesize finalPath;

#pragma mark  = Basic Setting =

- (void)viewDidLoad {
	[self setContentValue];	
	[super viewDidLoad];
		
}

- (void) backBtnTouched:(id)sender {
	[self dismissModalViewControllerAnimated: YES];
}

#pragma mark = Data Logics =

- (void) setContentValue {	  
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *documentsDirectory = [paths objectAtIndex:0];
	finalPath = [[documentsDirectory stringByAppendingPathComponent:plistName]retain];	
	plistData = [[[NSMutableDictionary alloc] initWithContentsOfFile:finalPath]retain];
	titles = [[NSMutableArray alloc] initWithArray:[plistData objectForKey:@"Titles"]];
	contents = [[NSMutableArray alloc] initWithArray:[plistData objectForKey:@"Contents"]];
	myTitle = [titles objectAtIndex: memoNumber];
	myContent = [contents objectAtIndex: memoNumber];
	
	myTextField.text = myTitle;
	myTextView.text = myContent;
	
	[myBackBtn setTitle:@"Back" forState:UIControlStateNormal];
}

#pragma mark = TextField =
	
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	myTitle = myTextField.text;
	[titles replaceObjectAtIndex:memoNumber withObject:myTitle];
	[plistData setObject:titles forKey:@"Titles"];
	[plistData writeToFile:finalPath atomically:YES];
	[myTextField resignFirstResponder];
	return YES;
}

#pragma mark = TextView =

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range 
 replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
		myContent = myTextView.text;
    	[contents replaceObjectAtIndex:memoNumber withObject:myContent];
		[plistData setObject:contents forKey:@"Contents"];
		[plistData writeToFile:finalPath atomically:YES];
		[myTextView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
	[myTextView resignFirstResponder];
	return YES;
}
#pragma mark = Memory Management =

- (void)didReceiveMemoryWarning {
	self.myTextView = nil;
	self.myBackBtn = nil;
	[super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	self.myTextView = nil;
	self.myBackBtn = nil;
	[super viewDidUnload];
}

- (void)dealloc {
	[super dealloc];
}


@end
