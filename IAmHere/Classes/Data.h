//
//  Data.h
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject

+(Data*)sharedInstance;
-(void) updateLastSubmittedDate:(NSDate *)lastSubmittedDate;
-(NSString*) getRelativeTime;

@end
