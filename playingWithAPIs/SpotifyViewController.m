//
//  SpotifyViewController.m
//  playingWithAPIs
//
//  Created by Cooper Veysey on 6/13/15.
//  Copyright (c) 2015 Cooper Veysey. All rights reserved.
//

#import "SpotifyViewController.h"
#import <Spotify/Spotify.h>
//#import "UIApplication.h"


@interface SpotifyViewController () <SPTAudioStreamingDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *albumCoverImage;
@property (weak, nonatomic) IBOutlet UILabel *songTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spotifySpinner;
- (IBAction)playButtonTapped:(id)sender;



@property (nonatomic, strong) SPTAudioStreamingController *player;

@end

@implementation SpotifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self spotifyAuth];
    // Construct a login URL and open it
//    NSURL *loginURL = [[SPTAuth defaultInstance] loginURL];
//    
//    // Opening a URL in Safari close to application launch may trigger
//    // an iOS bug, so we wait a bit before doing so.
//    [[UIApplication sharedApplication] performSelector:@selector(openURL:)
//                      withObject:loginURL afterDelay:0.3];

    // Do any additional setup after loading the view.
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
    

    
}
@end
