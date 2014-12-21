//
//  SubmitLocationOperation.h
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "BaseOperation.h"

@interface SubmitLocationOperation : BaseOperation

+(void)submitLocation:(CLLocation*)myLocation forUser:(NSString*)user withDelegate:(id<OperationDelegate>)inDelegate;

@end
