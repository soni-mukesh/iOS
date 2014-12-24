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
    [self setApplicationRunningInForeground:YES];

    if (![Utility getValueFromPermanentStoreForKey:kLastSubmittedKey]) {
        [SubmitLocationOperation submitLocation:[LocationManager sharedInstance].location forUser:[Utility getValueFromPermanentStoreForKey:kUsernameKey] withDelegate:self];
    }
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [LocationManager stopUpdating];
    
    [self setApplicationRunningInForeground:NO];
    
    [SubmitLocationOperation submitLocation:[LocationManager sharedInstance].location forUser:[Utility getValueFromPermanentStoreForKey:kUsernameKey] withDelegate:self];
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