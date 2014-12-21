//
//  AppDelegate.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "AppDelegate.h"

static NSString* const kAcceptEncoding         =  @"Accept-Encoding";
static NSString* const kGzip                   =  @"gzip";
static NSString* const kLocationServiceUnavaliableMsg                   =  @"Location Service is not enable, Please enable it from Settings.";

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if(![CLLocationManager locationServicesEnabled])
    {
        [Utility showAlertWithMessage:kLocationServiceUnavaliableMsg withDelegate:nil];
    }
    
    [LocationManager startUpdating];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [LocationManager stopUpdating];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    [LocationManager startUpdating];
}

@end