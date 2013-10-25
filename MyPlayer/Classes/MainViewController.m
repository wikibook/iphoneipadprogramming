//
//  MainViewController.m
//  MyPlayer
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import "MainViewController.h"
#include "MediaPlayer/MediaPlayer.h"  

@implementation MainViewController

@synthesize whichOne;
@synthesize mp3Label;
@synthesize playBtn;
@synthesize theMovie;

- (void)viewDidLoad {
	
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
   
	self.whichOne = nil;
	self.mp3Label = nil;
	self.playBtn =  nil;
    [super didReceiveMemoryWarning];

}

- (void)viewDidUnload {
	self.whichOne = nil;
	self.mp3Label = nil;
	self.playBtn =  nil;
    [super viewDidUnload];

}

- (void)dealloc {
	[whichOne release];
	[mp3Label release];
	[playBtn release];
    [super dealloc];
}

- (IBAction) playBtnTouched {
	[myPlayer stop];

	NSBundle* bundle = [NSBundle mainBundle];
	NSString* filePath;
	
	if (whichOne.on == YES) {
		
		filePath = [bundle pathForResource:@"sampleMusic" ofType:@"mp3"];
		NSURL* url = [NSURL fileURLWithPath: filePath];
		myPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL :url error:nil];  
		myPlayer.delegate = self;
		[myPlayer play];
		
	} else {

		filePath = [bundle pathForResource:@"sampleMovie" ofType:@"mp4"];
		NSURL *url = [NSURL fileURLWithPath:filePath];
		theMovie = [[MPMoviePlayerController alloc] initWithContentURL:url];
		theMovie.scalingMode = MPMovieScalingModeAspectFit; 
		
		theMovie.movieControlMode = MPMovieControlModeDefault;
		[theMovie setFullscreen:YES];	
		
		[self.view addSubview:theMovie.view];
		theMovie.view.frame = CGRectMake(0, 0, 320, 480);  
		[theMovie play];
		
		[[NSNotificationCenter defaultCenter] addObserver:self 
											  selector:@selector(myMovieFinishedCallback:) 
											  name:MPMoviePlayerPlaybackDidFinishNotification 
											  object:theMovie]; 

	}	
}

-(void) myMovieFinishedCallback:(NSNotification*)aNotification 
{
  
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:MPMoviePlayerPlaybackDidFinishNotification 
                                                  object:theMovie]; 
	[[theMovie view]removeFromSuperview];
    [theMovie release]; 

	
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer*) player
						successfully:(BOOL) flag
{
	if (flag == YES) {
		NSLog(@"음악이 성공적으로 재생되었습니다.");
	} else {
		NSLog(@"음악 재생에 문제가 있었습니다.");
	}
}

@end
