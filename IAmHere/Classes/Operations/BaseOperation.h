#import "MKNetworkOperation.h"
#import "OperationDelegate.h"
#import "AppDelegate.h"

typedef enum{
    OperationStatusFailure = 0,
    OperationStatusSuccess,
    OperationStatusInvalid
}OperationStatus;

typedef void (^OperationErrorHandler)(NSError* error);

@interface BaseOperation : MKNetworkOperation

@property (readwrite, weak) id <OperationDelegate> delegate;

-(id)initOperationForUrl: (NSString *) inUrl withParams:(NSDictionary *)inParams havingHTTPMethod:(NSString *) inHTTPMethod checkTimeout:(BOOL) isTimeoutValid;

-(void)processOperationOnCompletion:(void(^)(NSInteger))completionHandler errorHandler:(OperationErrorHandler)errorHandler;

-(void) logRequestResponseAsCURLStatement;

@end
