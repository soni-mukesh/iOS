//
//  AppDelegate.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "AppDelegate.h"
#import "SubmitLocationOperation.h"

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
    NSString *temp = [Utility getUsernameFromPermanentStore];
    DLog(@"username = '%@'", temp);
    [self setApplicationRunningInForeground:YES];

    if (![Utility getUsernameFromPermanentStore]) {
        [SubmitLocationOperation submitLocation:[LocationManager sharedInstance].location forUser:[Utility getUsernameFromPermanentStore] withDelegate:self];
    }
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [LocationManager stopUpdating];
    
    [self setApplicationRunningInForeground:NO];
    
    [SubmitLocationOperation submitLocation:[LocationManager sharedInstance].location forUser:[Utility getUsernameFromPermanentStore] withDelegate:self];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    [self setApplicationRunningInForeground:YES];
    [LocationManager startUpdating];
}

#pragma mark WebServiceDelegate

- (void) webServiceRequestSucceed:(NSInteger)inResponse forRequestClass:(Class)inRequestClass{
    if (inRequestClass == [SubmitLocationOperation class]) {
        switch (inResponse) {
            case OperationStatusSuccess:
                [Utility showAlertWithMessage:NSLocalizedString(@"SubmitLocationSuccessMsg", nil) withDelegate:nil];
                break;
            case OperationStatusFailure:
                [Utility showAlertWithMessage:NSLocalizedString(@"SubmitLocationErrorMsg", nil) Title:@"Error title" withDelegate:nil];
                break;
            case OperationStatusInvalid:
                [Utility showAlertWithMessage:NSLocalizedString(@"UnknownOperation", nil) Title:@"Error title" withDelegate:nil];
                break;
                
            default:
                break;
        }
    }
}
- (void) webServiceRequestFailed:(NSError*)inError forRequestClass:(Class)inRequestClass{
    if (inRequestClass == [SubmitLocationOperation class]) {
        [Utility showAlertWithMessage:NSLocalizedString(@"SubmitLocationErrorMsg", nil) withDelegate:nil];
    }
}
@end