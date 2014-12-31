#import "SubmitLocationOperation.h"

@implementation SubmitLocationOperation

+(void)submitLocation:(CLLocation*)myLocation forUser:(NSString*)user withDelegate:(id<OperationDelegate>)inDelegate{
    
    SubmitLocationOperation*   submitLocationOperation = [[SubmitLocationOperation alloc] initOperationForUrl:kApplicationEndPointURL withParams:nil havingHTTPMethod:kPOST checkTimeout:NO];
    
    NSString *data = [NSString stringWithFormat:@"data=%@ is now at %f/%f", user, myLocation.coordinate.latitude, myLocation.coordinate.longitude];
    
    [submitLocationOperation setCustomPostDataEncodingHandler:^NSString *(NSDictionary *postDataDict) { return data; } forType:kContentTypeText];
    
    [submitLocationOperation setDelegate:inDelegate];
    [submitLocationOperation processOperationOnCompletion:^(NSInteger status)
     {
         [submitLocationOperation logRequestResponseAsCURLStatement];
         [Utility saveToPermanentStoreValue:user forKey:kUsernameKey];
         [inDelegate webServiceRequestSucceed:status forRequestClass:[self class]];
         
     } errorHandler:^(NSError *error) {
         [inDelegate webServiceRequestFailed:error forRequestClass:[self class]];
     }];
}

@end
