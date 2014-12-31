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

- (void) processOperationOnCompletion:(void(^)(NSInteger))completionHandler errorHandler:(OperationErrorHandler)errorHandler {
    
    [self addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        DLog(@"Readonly response %@", completedOperation.readonlyResponse)
        if([completedOperation.url rangeOfString:kApplicationEndPointURL].length) {
            if (completedOperation.HTTPStatusCode == kHTTPStatus201) {
                NSString *lastSubmittedDate = [completedOperation.readonlyResponse.allHeaderFields objectForKey:@"Date"];
                if (lastSubmittedDate) {
                    [[Data sharedInstance]  updateLastSubmittedDate:lastSubmittedDate];
                }
                completionHandler(OperationStatusSuccess);
            }else{
                completionHandler(OperationStatusFailure);
            }
        }else{
            completionHandler(OperationStatusInvalid);
        }
    }
    errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        errorHandler(error);
    }];
    [ApplicationDelegate.network enqueueOperation:self];
}

-(void) operationFailedWithError:(NSError*) error {
    [[self delegate] webServiceRequestFailed:error forRequestClass:[self class]];
}

-(void) logRequestResponseAsCURLStatement{
    DLog(@"%@ On %@", [self class], [self description]);
}

@end

