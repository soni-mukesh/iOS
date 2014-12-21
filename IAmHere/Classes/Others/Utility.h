//
//  Utility.h
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

@interface Utility : NSObject

+(UIAlertView*)showAlertWithMessage:(NSString*)messageKey withDelegate:(id)delegate;
+(UIAlertView*)showAlertWithMessage:(NSString*)messageKey Title:(NSString*)headerKey withDelegate:(id)delegate ;

@end