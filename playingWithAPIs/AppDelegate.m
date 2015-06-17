//
//  AppDelegate.m
//  playingWithAPIs
//
//  Created by Cooper Veysey on 6/6/15.
//  Copyright (c) 2015 Cooper Veysey. All rights reserved.
//

#import "AppDelegate.h"
#import "APIHomeScreenTableViewController.h"
#import "API.h"
#import "GoogleMaps.h"
#import <Venmo-iOS-SDK/Venmo.h>
#import <Spotify/Spotify.h>
#import "SpotifyViewController.h"

@interface AppDelegate ()

@property (nonatomic,strong) SpotifyViewController *something;

@end

@implementation AppDelegate {
    NSMutableArray *_APIs;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _APIs = [NSMutableArray arrayWithCapacity:20];
    
    API *api = [[API alloc]init];
    api.name = @"Spotify";
    api.fileNameOfLogo = @"SpotifyLogox2.png";
    [_APIs addObject:api];
    
    api = [[API alloc]init];
    api.name = @"Twilio";
    api.fileNameOfLogo = @"TwilioLogox2.png";
    [_APIs addObject:api];
    
    api = [[API alloc]init];
    api.name = @"Google Maps";
    api.fileNameOfLogo = @"GoogleMapsLogoTransBack.png";
    [_APIs addObject:api];
    
    api = [[API alloc]init];
    api.name = @"Venmo";
    api.fileNameOfLogo = @"VenmoLogox2.png";
    [_APIs addObject:api];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController = [tabBarController viewControllers][0];
    APIHomeScreenTableViewController *apiHomeScreenTableViewController = [navigationController viewControllers][0];
    apiHomeScreenTableViewController.APIs = _APIs;
    
//    _APIs = [NSMutableArray arrayWithObjects:@"Spotify", @"Google Maps", @"Venmo", nil];
//    self.window.rootViewController = self.
    // Override point for customization after application launch.
    
    [GMSServices provideAPIKey:@"AIzaSyDzQY6dLGDGD65vIwPImPx-R_A-QOiSUC8"];
    
    [Venmo startWithAppId:@"2682" secret:@"Z96uc9MW7XSDPSESGDUATDCx4YjdusEL" name:@"playingWithAPIs"];
    
    [[SPTAuth defaultInstance] setClientID:@"499d570312f34ad2a590cac79eac9aca"];
    [[SPTAuth defaultInstance] setRedirectURL:[NSURL URLWithString:@"playingwithapis://callback"]];
    [[SPTAuth defaultInstance] setRequestedScopes:@[SPTAuthStreamingScope]];

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    NSLog(@"just before _something");
    _something = [[SpotifyViewController alloc]init];
    
    NSLog(@"just after _something");
    if ([[Venmo sharedInstance] handleOpenURL:url]) {
        return YES;
    }
    NSLog(@"just before if");
    if ([[SPTAuth defaultInstance] canHandleURL:url]) {
        NSLog(@"just before SPTAuth defaultInstance");
        [[SPTAuth defaultInstance] handleAuthCallbackWithTriggeredAuthURL:url callback:^(NSError *error, SPTSession *session) {
            
            if (error != nil) {
                NSLog(@"*** Auth error: %@", error);
                return;
            }
            NSLog(@"just before _something playUsingSession:session");
            // Call the -playUsingSession: method to play a track
            [_something playUsingSession:session];
        }];
        
        NSLog(@"just before return YES;");
        return YES;
    }
    NSLog(@"before else return NO");
    // You can add your app-specific url handling code here if needed
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Cooper.Veysey.playingWithAPIs" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"playingWithAPIs" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"playingWithAPIs.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
