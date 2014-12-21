//
//  BaseOperation.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "BaseOperation.h"

static NSString* const kUsername        = @"mukesh";
static NSString* const kPassword        = @"milton34";

@implementation BaseOperation

-(id)initOperationForUrl: (NSString *) inUrl withParams:(NSDictionary *)inParams havingHTTPMethod:(NSString *) inHTTPMethod checkTimeout:(BOOL) isTimeoutValid {
    
    self = [self initWithURLString:inUrl params:inParams httpMethod:inHTTPMethod];
    [ApplicationDelegate.network prepareHeaders:self];
    [self setUsername:kUsername password:kPassword basicAuth:YES];
    return self;
}

- (void) processOperationOnCompletion:(void(^)())completionHandler errorHandler:(OperationErrorHandler)errorHandler {
    
    [self addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        DLog(@"response headers: %@", completedOperation.readonlyResponse.allHeaderFields);
        DLog(@"response : %s", [completedOperation.responseData bytes]);
        
        completionHandler();
    }
    errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        errorHandler(error);
    }];
    [ApplicationDelegate.network enqueueOperation:self];
}

-(void) operationFailedWithError:(NSError*) error {
    [[self delegate] webServiceRequestFailed:error forRequestClass:[self class]];
}

@end

