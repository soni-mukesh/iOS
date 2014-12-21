//
//  Utility.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "Utility.h"
#import "AppDelegate.h"

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

+(NSString*) getValueFromPermanentStoreForKey:(NSString*) key{
    NSString *username = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    return username;
}

+(void) saveToPermanentStoreValue:(NSString*) value forKey:(NSString*) key{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
