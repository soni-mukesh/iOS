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

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSDictionary *headers = @{kContentType : kContentTypeJson, kAcceptEncoding : kGzip};
    self.network = [[MKNetworkEngine alloc] initWithHostName:nil customHeaderFields:headers];

    if(![CLLocationManager locationServicesEnabled])
    {
        [Utility showAlertWithMessage:NSLocalizedString(@"LocationDisabledErrorMsg", nil) withDelegate:nil];
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