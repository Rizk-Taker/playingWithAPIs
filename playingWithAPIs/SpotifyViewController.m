//
//  SpotifyViewController.m
//  playingWithAPIs
//
//  Created by Cooper Veysey on 6/13/15.
//  Copyright (c) 2015 Cooper Veysey. All rights reserved.
//

#import "SpotifyViewController.h"
#import <Spotify/Spotify.h>



@interface SpotifyViewController () <SPTAudioStreamingDelegate, SPTAudioStreamingPlaybackDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *albumCoverImage;
@property (weak, nonatomic) IBOutlet UILabel *songTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spotifySpinner;
@property (weak, nonatomic) IBOutlet UIProgressView *trackProgressView;
@property (weak, nonatomic) IBOutlet UIButton *spotifySkipButton;
@property (weak, nonatomic) IBOutlet UIButton *spotifyPreviousButton;


- (IBAction)playButtonTapped:(id)sender;
- (IBAction)pauseButtonTapped:(id)sender;

@property (nonatomic, strong) SPTAudioStreamingController *player;

@end

@implementation SpotifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self spotifyAuth];
    
    self.pauseButton.hidden = YES;
    self.playButton.hidden = NO;
    
    [self.view removeConstraints:self.view.constraints];
    [self.backgroundView removeConstraints:self.backgroundView.constraints];
    [self.pauseButton removeConstraints:self.pauseButton.constraints];
    [self.playButton removeConstraints:self.playButton.constraints];
    [self.artistNameLabel removeConstraints:self.artistNameLabel.constraints];
    [self.songTitleLabel removeConstraints:self.songTitleLabel.constraints];
    [self.albumCoverImage removeConstraints:self.albumCoverImage.constraints];
    [self.trackProgressView removeConstraints:self.trackProgressView.constraints];
    [self.spotifyPreviousButton removeConstraints:self.spotifyPreviousButton.constraints];
    [self.spotifySkipButton removeConstraints:self.spotifySkipButton.constraints];
    
    self.backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    self.pauseButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.playButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.artistNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.songTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.albumCoverImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.trackProgressView.translatesAutoresizingMaskIntoConstraints = NO;
    self.spotifySkipButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.spotifyPreviousButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *backgroundViewHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.backgroundView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:backgroundViewHeightConstraint];
    
    NSLayoutConstraint *backgroundViewWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.backgroundView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:backgroundViewWidthConstraint];
    
    NSLayoutConstraint *backgroundViewCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.backgroundView
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:backgroundViewCenterXConstraint];
    
    NSLayoutConstraint *backgroundViewCenterYConstraint =
    [NSLayoutConstraint constraintWithItem:self.backgroundView
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:backgroundViewCenterYConstraint];
    
    
    NSLayoutConstraint *albumCoverImageTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.albumCoverImage
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:60];
    
    [self.view addConstraint:albumCoverImageTopConstraint];
    
    NSLayoutConstraint *albumCoverImageHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.albumCoverImage
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:.40
                                  constant:0];
    
    [self.view addConstraint:albumCoverImageHeightConstraint];
    
    NSLayoutConstraint *albumCoverImageWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.albumCoverImage
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.75
                                  constant:0];
    
    [self.view addConstraint:albumCoverImageWidthConstraint];
    
    NSLayoutConstraint *albumCoverImageCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.albumCoverImage
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:albumCoverImageCenterXConstraint];
    
//    NSLayoutConstraint *albumCoverImageLeftConstraint =
//    [NSLayoutConstraint constraintWithItem:self.albumCoverImage
//                                 attribute:NSLayoutAttributeLeft
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.view
//                                 attribute:NSLayoutAttributeLeft
//                                multiplier:1
//                                  constant:15];
//    
//    [self.view addConstraint:albumCoverImageLeftConstraint];
//    
//    NSLayoutConstraint *albumCoverImageRightConstraint =
//    [NSLayoutConstraint constraintWithItem:self.albumCoverImage
//                                 attribute:NSLayoutAttributeRight
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.view
//                                 attribute:NSLayoutAttributeRight
//                                multiplier:1
//                                  constant:-15];
//    
//    [self.view addConstraint:albumCoverImageRightConstraint];
    
    NSLayoutConstraint *songTitleLabelCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.songTitleLabel
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:songTitleLabelCenterXConstraint];
    
    NSLayoutConstraint *songTitleLabelTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.songTitleLabel
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.albumCoverImage
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:25];
    
    [self.view addConstraint:songTitleLabelTopConstraint];
    
    NSLayoutConstraint *artistNameLabelCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.artistNameLabel
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:artistNameLabelCenterXConstraint];
    
    NSLayoutConstraint *artistNameLabelTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.artistNameLabel
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.songTitleLabel
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:artistNameLabelTopConstraint];
    
    NSLayoutConstraint *trackProgressViewCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.trackProgressView
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:trackProgressViewCenterXConstraint];
    
    NSLayoutConstraint *trackProgressViewTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.trackProgressView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.artistNameLabel
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:30];
    
    [self.view addConstraint:trackProgressViewTopConstraint];
    
    NSLayoutConstraint *trackProgressViewWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.trackProgressView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.80
                                  constant:0];
    
    [self.view addConstraint:trackProgressViewWidthConstraint];
    
    NSLayoutConstraint *trackProgressViewHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.trackProgressView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:.007
                                  constant:0];
    
    [self.view addConstraint:trackProgressViewHeightConstraint];
    
    NSLayoutConstraint *playButtonCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.playButton
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:playButtonCenterXConstraint];
    
    NSLayoutConstraint *playButtonTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.playButton
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.trackProgressView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:60];
    
    [self.view addConstraint:playButtonTopConstraint];
    
    NSLayoutConstraint *playButtonHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.playButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeHeight
                                multiplier:.12
                                  constant:0];
    
    [self.view addConstraint:playButtonHeightConstraint];
    
    NSLayoutConstraint *playButtonWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.playButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.playButton
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:playButtonWidthConstraint];
    
    NSLayoutConstraint *pauseButtonCenterXConstraint =
    [NSLayoutConstraint constraintWithItem:self.pauseButton
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.albumCoverImage
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:pauseButtonCenterXConstraint];
    
    NSLayoutConstraint *pauseButtonTopConstraint =
    [NSLayoutConstraint constraintWithItem:self.pauseButton
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.playButton
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:pauseButtonTopConstraint];
    
    NSLayoutConstraint *pauseButtonHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.pauseButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.playButton
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:pauseButtonHeightConstraint];
    
    NSLayoutConstraint *pauseButtonWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.pauseButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.pauseButton
                                 attribute:NSLayoutAttributeHeight
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:pauseButtonWidthConstraint];
    
//    NSLayoutConstraint *spotifyPreviousButtonCenterXConstraint =
//    [NSLayoutConstraint constraintWithItem:self.spotifyPreviousButton
//                                 attribute:NSLayoutAttributeCenterX
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.view
//                                 attribute:NSLayoutAttributeCenterX
//                                multiplier:.25
//                                  constant:0];
//    
//    [self.view addConstraint:spotifyPreviousButtonCenterXConstraint];
    
        NSLayoutConstraint *spotifyPreviousButtonRightConstraint =
        [NSLayoutConstraint constraintWithItem:self.spotifyPreviousButton
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self.playButton
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:-20];
    
        [self.view addConstraint:spotifyPreviousButtonRightConstraint];
    
    NSLayoutConstraint *spotifyPreviousButtonCenterYConstraint =
    [NSLayoutConstraint constraintWithItem:self.spotifyPreviousButton
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.playButton
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:spotifyPreviousButtonCenterYConstraint];
    
//    NSLayoutConstraint *spotifyPreviousButtonTopConstraint =
//    [NSLayoutConstraint constraintWithItem:self.spotifyPreviousButton
//                                 attribute:NSLayoutAttributeTop
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.playButton
//                                 attribute:NSLayoutAttributeTop
//                                multiplier:1.0
//                                  constant:15];
//    
//    [self.view addConstraint:spotifyPreviousButtonTopConstraint];
    
    NSLayoutConstraint *spotifyPreviousButtonHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.spotifyPreviousButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.playButton
                                 attribute:NSLayoutAttributeHeight
                                multiplier:.27
                                  constant:0];
    
    [self.view addConstraint:spotifyPreviousButtonHeightConstraint];
    
    NSLayoutConstraint *spotifyPreviousButtonWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.spotifyPreviousButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.playButton
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.27
                                  constant:0];
    
    [self.view addConstraint:spotifyPreviousButtonWidthConstraint];
    
//    NSLayoutConstraint *spotifySkipButtonCenterXConstraint =
//    [NSLayoutConstraint constraintWithItem:self.spotifySkipButton
//                                 attribute:NSLayoutAttributeCenterX
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.view
//                                 attribute:NSLayoutAttributeCenterX
//                                multiplier:1.75
//                                  constant:0];
//    
//    [self.view addConstraint:spotifySkipButtonCenterXConstraint];
    
    NSLayoutConstraint *spotifySkipButtonCenterYConstraint =
    [NSLayoutConstraint constraintWithItem:self.spotifySkipButton
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.playButton
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0];
    
    [self.view addConstraint:spotifySkipButtonCenterYConstraint];
    
//    NSLayoutConstraint *spotifySkipButtonTopConstraint =
//    [NSLayoutConstraint constraintWithItem:self.spotifySkipButton
//                                 attribute:NSLayoutAttributeTop
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.playButton
//                                 attribute:NSLayoutAttributeTop
//                                multiplier:1.0
//                                  constant:15];
//    
//    [self.view addConstraint:spotifySkipButtonTopConstraint];
    
    NSLayoutConstraint *spotifySkipButtonHeightConstraint =
    [NSLayoutConstraint constraintWithItem:self.spotifySkipButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.playButton
                                 attribute:NSLayoutAttributeHeight
                                multiplier:.27
                                  constant:0];
    
    [self.view addConstraint:spotifySkipButtonHeightConstraint];
    
    NSLayoutConstraint *spotifySkipButtonWidthConstraint =
    [NSLayoutConstraint constraintWithItem:self.spotifySkipButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.playButton
                                 attribute:NSLayoutAttributeWidth
                                multiplier:.27
                                  constant:0];
    
    [self.view addConstraint:spotifySkipButtonWidthConstraint];
    
    NSLayoutConstraint *spotifySkipButtonLeftConstraint =
    [NSLayoutConstraint constraintWithItem:self.spotifySkipButton
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.playButton
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:20];
    
    [self.view addConstraint:spotifySkipButtonLeftConstraint];

    // Do any additional setup after loading the view.
    
    self.songTitleLabel.text = @"River of Dreams";
    self.songTitleLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:19];
    self.songTitleLabel.textColor = [UIColor whiteColor];
    
    self.artistNameLabel.text = @"Bruce Springsteen";
    self.artistNameLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:15];
    self.artistNameLabel.textColor = [UIColor colorWithRed:175.0/255.0 green:181.0/255.0 blue:187.0/255.0 alpha:1.0];
    
    self.albumCoverImage.image = [UIImage imageNamed:@"bossAlbumCover.jpg"];
    self.backgroundView.backgroundColor = [UIColor blackColor];
    self.trackProgressView.progressTintColor = [UIColor colorWithRed:161.0/255.0 green:200.0/255.0 blue:61.0/255.0 alpha:1.0];
    
    self.trackProgressView.trackTintColor = [UIColor whiteColor];
    
//    self.proposalTableViewProgressView.trackTintColor = [UIColor grayColor];
//    self.trackProgressView.transform = CGAffineTransformMakeScale(1.0f, 5.0f);
//    self.proposalTableViewProgressView.layer.cornerRadius = 20.0f;
//    self.proposalTableViewProgressView.layer.masksToBounds = TRUE;
    self.view.clipsToBounds = TRUE;
}

-(BOOL)spotifyAuth {
    
    NSLog(@"spotifyAuth is getting called");
    NSURL *loginURL = [[SPTAuth defaultInstance] loginURL];
    
    // Opening a URL in Safari close to application launch may trigger
    // an iOS bug, so we wait a bit before doing so.
    [[UIApplication sharedApplication] performSelector:@selector(openURL:)
                      withObject:loginURL afterDelay:0.1];
    return YES;
}

-(void)playUsingSession:(SPTSession *)session {
    NSLog(@"playUsingSession");
    // Create a new player if needed
    if (self.player == nil) {
        self.player = [[SPTAudioStreamingController alloc] initWithClientId:[SPTAuth defaultInstance].clientID];
    }
    
    [self.player loginWithSession:session callback:^(NSError *error) {
        if (error != nil) {
            NSLog(@"*** Logging in got error: %@", error);
            return;
        }
        
        NSURL *trackURI = [NSURL URLWithString:@"spotify:track:58s6EuEYJdlb0kO7awm3Vp"];
        [self.player playURIs:@[ trackURI ] fromIndex:0 callback:^(NSError *error) {
            if (error != nil) {
                NSLog(@"*** Starting playback got error: %@", error);
                return;
            }
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateUI {
    SPTAuth *auth = [SPTAuth defaultInstance];
    
    if (self.player.currentTrackURI == nil) {
        self.albumCoverImage.image = nil;
        return;
    }
    
    [self.spotifySpinner startAnimating];
    
    [SPTTrack trackWithURI:self.player.currentTrackURI
                   session:auth.session
                  callback:^(NSError *error, SPTTrack *track) {
                      
                      self.songTitleLabel.text = track.name;
                      
                      SPTPartialArtist *artist = [track.artists objectAtIndex:0];
                      self.artistNameLabel.text = artist.name;
                      
                      NSURL *imageURL = track.album.largestCover.imageURL;
                      if (imageURL == nil) {
                          NSLog(@"Album %@ doesn't have any images!", track.album);
                          self.albumCoverImage.image = nil;
                          return;
                      }
                      
                      // Pop over to a background queue to load the image over the network.
                      dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                          NSError *error = nil;
                          UIImage *image = nil;
                          NSData *imageData = [NSData dataWithContentsOfURL:imageURL options:0 error:&error];
                          
                          if (imageData != nil) {
                              image = [UIImage imageWithData:imageData];
                          }
                          
                          
                          // …and back to the main queue to display the image.
                          dispatch_async(dispatch_get_main_queue(), ^{
                              [self.spotifySpinner stopAnimating];
                              self.albumCoverImage.image = image;
                              if (image == nil) {
                                  NSLog(@"Couldn't load cover image with error: %@", error);
                                  return;
                              }
                          });
                          
                          // Also generate a blurry version for the background
                          UIImage *blurred = [self applyBlurOnImage:image withRadius:10.0f];
                          dispatch_async(dispatch_get_main_queue(), ^{
                              self.albumCoverImage.image = blurred;
                          });
                      });
                      
                  }];
}

- (UIImage *)applyBlurOnImage: (UIImage *)imageToBlur
                   withRadius: (CGFloat)blurRadius {
    
    CIImage *originalImage = [CIImage imageWithCGImage: imageToBlur.CGImage];
    CIFilter *filter = [CIFilter filterWithName: @"CIGaussianBlur"
                                  keysAndValues: kCIInputImageKey, originalImage,
                        @"inputRadius", @(blurRadius), nil];
    
    CIImage *outputImage = filter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef outImage = [context createCGImage: outputImage
                                        fromRect: [outputImage extent]];
    
    UIImage *ret = [UIImage imageWithCGImage: outImage];
    
    CGImageRelease(outImage);
    
    return ret;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)playButtonTapped:(id)sender {
    self.playButton.hidden = YES;
    self.pauseButton.hidden = NO;
    [self.player setIsPlaying:true callback:nil];
//seekToOffset:(NSTimeInterval)offset callback:(SPTErrorableOperationCallback)block;
//    [self.player setIsPlaying:!self.player.isPlaying callback:nil];
    NSLog(@"wtf");
//    [self.player setIsPlaying:!self.player.isPlaying callback:nil];
    
}

- (IBAction)pauseButtonTapped:(id)sender {
    
    self.pauseButton.hidden = YES;
    self.playButton.hidden = NO;
    
    [self.player setIsPlaying:false callback:nil];
    NSLog(@"wtfpause");
}
@end
