#import "BaseOperation.h"

@interface SubmitLocationOperation : BaseOperation

+(void)submitLocation:(CLLocation*)myLocation forUser:(NSString*)user withDelegate:(id<OperationDelegate>)inDelegate;

@end
