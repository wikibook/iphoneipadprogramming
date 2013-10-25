//
//  ListViewController.m
//  Memo
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import "ListViewController.h"
#import "ContentViewController.h"

#define plistName @"SavedData.plist"

@implementation ListViewController

@synthesize myTable;
@synthesize plistData;
@synthesize titles;
@synthesize subject;
@synthesize cvc;

#pragma mark  = Basic Setting =

- (void)viewWillAppear:(BOOL)animated {
	[self createEditableCopyOfPlistIfNeeded];
	[self loadPlistData];
	[self setTableSetting];	
	[myTable reloadData];
	[super viewDidLoad];

}

#pragma mark = Data Logics =

- (void)createEditableCopyOfPlistIfNeeded {
	NSArray *paths = NSSearchPathForDirectoriesInDomains
	(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	
	NSString *finalPath = [documentsDirectory 
						   stringByAppendingPathComponent:plistName];
	BOOL success;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error;
	
    success = [fileManager fileExistsAtPath:finalPath];
    if (success) return; //  파일이 있으면 그냥 메소드 끝, 없으면 밑 실행.
	
    NSString *defaultDBPath = [[[NSBundle mainBundle]  resourcePath] stringByAppendingPathComponent:plistName];
    success = [fileManager copyItemAtPath:defaultDBPath toPath:finalPath error:&error];
    
	// 혹시 뭔가의 에러과 발생할 경우 (보통은 에러없음)
	if (!success) {
        NSLog( @"다음과 같은 이유로 파일복사가 되지않았습니다 : '%@'.", [error localizedDescription]);
    }
	
}

- (void)loadPlistData {
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *finalPath = [documentsDirectory stringByAppendingPathComponent:plistName];	
	plistData = [NSDictionary dictionaryWithContentsOfFile: finalPath];
}
							  
- (void) setTableSetting {
	titles = [[NSArray alloc] initWithArray:[plistData objectForKey:@"Titles"]];
	myTable.backgroundColor = [UIColor clearColor]; 
	UIImageView* tableView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"TableBg.png"]];
	myTable.backgroundView = tableView;
	

}

#pragma mark = Table Logics =

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { 

	static NSString *CellIdentifier = @"Cell";
		
	UITableViewCell *cell = [tableView 
			dequeueReusableCellWithIdentifier: CellIdentifier];
	
	if (cell == nil) { cell = [[[UITableViewCell alloc]
								initWithFrame:CGRectZero 
								reuseIdentifier: CellIdentifier]
							   autorelease];
	}
	
	cell.textLabel.text = [titles objectAtIndex:(indexPath.row)];
	return cell;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section 
{
	return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath { 
	cvc = [[ContentViewController alloc] initWithNibName:@"ContentView" bundle: nil];
	int row = indexPath.row;
	cvc.memoNumber = row;
	[self presentModalViewController:cvc animated:YES];
}

#pragma mark = Memory Management =
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
	self.myTable = nil;
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.myTable = nil;
}

- (void)dealloc {
	[myTable release];
    [super dealloc];
}


@end
