//
//  BaseOperation.h
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "MKNetworkOperation.h"
#import "OperationDelegate.h"
#import "AppDelegate.h"

typedef void (^OperationErrorHandler)(NSError* error);

@interface BaseOperation : MKNetworkOperation

@property (readwrite, weak) id <OperationDelegate> delegate;

-(id)initOperationForUrl: (NSString *) inUrl withParams:(NSDictionary *)inParams havingHTTPMethod:(NSString *) inHTTPMethod checkTimeout:(BOOL) isTimeoutValid;

-(void)processOperationOnCompletion:(void(^)())completionBlock errorHandler:(OperationErrorHandler)errorHandler;

@end
