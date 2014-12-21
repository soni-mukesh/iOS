//
//  Data.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "Data.h"

@interface Data ()

@property (nonatomic, strong) NSDate *lastSubmittedDate;

-(void)initiateData;

@end

@implementation Data

+(Data*)sharedInstance {
    
    static Data* sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        sharedInstance = [[Data alloc] init];
        [sharedInstance initiateData];
    });
    return sharedInstance;
}

-(void)initiateData{
    self.lastSubmittedDate = [NSDate new];
}

-(void) updateLastSubmittedDate:(NSDate *)lastSubmittedDate{
    self.lastSubmittedDate = lastSubmittedDate;
}

-(NSString*) getRelativeTime{
    
    NSTimeInterval relativeTime = [self.lastSubmittedDate timeIntervalSinceNow];
    NSInteger timeInterval = -(relativeTime);
    NSString *relativeTimeAsString;
    
    if (timeInterval > (60*60)) {
        NSInteger hours = floor(timeInterval/(60*60));
        relativeTimeAsString = [NSString stringWithFormat:@"Last Submitted %ld Hours ago", (long)hours];
    }else if(timeInterval > 60){
        NSInteger minutes = floor(timeInterval/60);
        relativeTimeAsString = [NSString stringWithFormat:@"Last Submitted %ld Minutes ago", (long)minutes];
    }else{
        NSInteger remainingSeconds = round(timeInterval%60);
        relativeTimeAsString = [NSString stringWithFormat:@"Last Submitted %ld Seconds ago", (long)remainingSeconds];
    }
    return relativeTimeAsString;
}

@end
