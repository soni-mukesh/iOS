//
//  Utility.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "Utility.h"

static NSString* const kAlertTitle = @"IAmHere Error";

@implementation Utility

+(UIAlertView*)showAlertWithMessage:(NSString*)messageKey withDelegate:(id)delegate {
    
    UIAlertView* alertView  =   [[UIAlertView alloc] initWithTitle:NSLocalizedString(kAlertTitle, nil) message:NSLocalizedString(messageKey, nil) delegate:delegate cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles: nil];
    
    [alertView show];
    return alertView;
}

+(UIAlertView*)showAlertWithMessage:(NSString*)messageKey Title:(NSString*)headerKey withDelegate:(id)delegate {
    
    UIAlertView* alertView  =   [[UIAlertView alloc] initWithTitle:NSLocalizedString(headerKey, nil) message:NSLocalizedString(messageKey, nil) delegate:delegate cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles: nil];
    
    [alertView show];
    return alertView;
}

@end
