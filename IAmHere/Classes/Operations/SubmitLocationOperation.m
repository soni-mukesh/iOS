//
//  SubmitLocationOperation.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

//
//  SubmitLocationOperation.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Mukesh Soni. All rights reserved.
//

#import "SubmitLocationOperation.h"

@implementation SubmitLocationOperation

+(void)submitLocation:(CLLocation*)myLocation forUser:(NSString*)user withDelegate:(id<OperationDelegate>)inDelegate{
    
    NSString *requestUrl = @"http://gentle-tor-1851.herokuapp.com/events";
    DLog(@"RequestUrl :: %@",requestUrl);
    
    SubmitLocationOperation*   submitLocationOperation = [[SubmitLocationOperation alloc] initOperationForUrl:requestUrl withParams:nil havingHTTPMethod:kPOST checkTimeout:NO];
    
    
    NSString *data = [NSString stringWithFormat:@"Data=%@ is now at %f/%f", user, myLocation.coordinate.latitude, myLocation.coordinate.longitude];
    
    [submitLocationOperation setCustomPostDataEncodingHandler:^NSString *(NSDictionary *postDataDict) { return data; } forType:kContentTypeJson];
    
    [submitLocationOperation setDelegate:inDelegate];
    [submitLocationOperation processOperationOnCompletion:^()
     {
         DLog();
         [inDelegate webServiceRequestSucceed:@"Done" forRequestClass:self];
         
     } errorHandler:^(NSError *error) {
         DLog(@"%@", error.userInfo);
     }];
}

@end
