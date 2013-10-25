//
//  ListViewController.h
//  Memo
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContentViewController;

@interface ListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{

	UITableView* myTable;
	NSDictionary* plistData;
	NSArray* titles;
	NSString* subject;
	ContentViewController* cvc;
	
}

@property (nonatomic, retain) IBOutlet UITableView* myTable;
@property (nonatomic, retain) NSDictionary* plistData;
@property (nonatomic, retain) NSArray* titles;
@property (nonatomic, retain) NSString* subject;	
@property (nonatomic, retain) ContentViewController* cvc;

- (void) createEditableCopyOfPlistIfNeeded;
- (void) loadPlistData;
- (void) setTableSetting;

@end
