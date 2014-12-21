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
    
    SubmitLocationOperation*   submitLocationOperation = [[SubmitLocationOperation alloc] initOperationForUrl:kApplicationEndPointURL withParams:nil havingHTTPMethod:kPOST checkTimeout:NO];
    
    NSString *data = [NSString stringWithFormat:@"{\"Data\":\"%@ is now at %f/%f\"}", user, myLocation.coordinate.latitude, myLocation.coordinate.longitude];
    
    [submitLocationOperation setCustomPostDataEncodingHandler:^NSString *(NSDictionary *postDataDict) { return data; } forType:kContentTypeJson];
    
    [submitLocationOperation setDelegate:inDelegate];
    [submitLocationOperation processOperationOnCompletion:^(NSInteger status)
     {
         [Utility saveToPermanentStore:user];
         [inDelegate webServiceRequestSucceed:status forRequestClass:[self class]];
         
     } errorHandler:^(NSError *error) {
         [inDelegate webServiceRequestFailed:error forRequestClass:[self class]];
     }];
}

@end
