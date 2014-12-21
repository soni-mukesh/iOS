//
//  Utility.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "Utility.h"
#import "AppDelegate.h"


static NSString* const kAlertTitle = @"IAmHere";
static NSString* const kUsernameKey = @"username";

@implementation Utility

+(UIAlertView*)showAlertWithMessage:(NSString*)messageKey withDelegate:(id)delegate {
    
    if ([ApplicationDelegate isApplicationRunningInForeground]) {
        UIAlertView* alertView  =   [[UIAlertView alloc] initWithTitle:NSLocalizedString(kAlertTitle, nil) message:NSLocalizedString(messageKey, nil) delegate:delegate cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles: nil];
        
        [alertView show];
        return alertView;
    }
    return nil;
}

+(UIAlertView*)showAlertWithMessage:(NSString*)messageKey Title:(NSString*)headerKey withDelegate:(id)delegate {
    if ([ApplicationDelegate isApplicationRunningInForeground]) {
        UIAlertView* alertView  =   [[UIAlertView alloc] initWithTitle:NSLocalizedString(headerKey, nil) message:NSLocalizedString(messageKey, nil) delegate:delegate cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles: nil];
        
        [alertView show];
        return alertView;
    }
    return nil;
}

+(NSString*) getUsernameFromPermanentStore{
    NSString *username = [[NSUserDefaults standardUserDefaults] valueForKey:kUsernameKey];
    return username;
}

+(void) saveToPermanentStore:(NSString*) username{
    [[NSUserDefaults standardUserDefaults] setValue:username forKey:kUsernameKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
