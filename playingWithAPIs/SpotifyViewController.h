//
//  SpotifyViewController.h
//  playingWithAPIs
//
//  Created by Cooper Veysey on 6/13/15.
//  Copyright (c) 2015 Cooper Veysey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Spotify/Spotify.h>

@interface SpotifyViewController : UIViewController <SPTAudioStreamingDelegate, SPTAudioStreamingPlaybackDelegate>

-(void)playUsingSession:(SPTSession *)session;

@end
