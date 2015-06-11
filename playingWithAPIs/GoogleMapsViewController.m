//
//  GoogleMapsViewController.m
//  playingWithAPIs
//
//  Created by Cooper Veysey on 6/10/15.
//  Copyright (c) 2015 Cooper Veysey. All rights reserved.
//

#import "GoogleMapsViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface GoogleMapsViewController ()

@end

@implementation GoogleMapsViewController {
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden: NO];
    // Do any additional setup after loading the view.
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView_;
    
    mapView_.myLocationEnabled = YES;
    NSLog(@"User's location: %@", mapView_.myLocation);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
