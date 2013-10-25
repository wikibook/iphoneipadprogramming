//
//  MainViewController.h
//  MyPlayer
//
//  Created by Kang Byung Woo
//  Copyright St.Cocoa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MainViewController : UIViewController <AVAudioPlayerDelegate> {
	UISwitch* whichOne;
	UILabel* mp3Label;
	UIButton* playBtn;
	AVAudioPlayer* myPlayer;
	MPMoviePlayerController	*theMovie;
}

@property (nonatomic, retain) IBOutlet UISwitch* whichOne;
@property (nonatomic, retain) IBOutlet UILabel* mp3Label;
@property (nonatomic, retain) IBOutlet UIButton* playBtn;
@property (nonatomic, retain) MPMoviePlayerController *theMovie;

- (IBAction) playBtnTouched;

@end
