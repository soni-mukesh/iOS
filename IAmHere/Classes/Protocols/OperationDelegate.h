//
//  OperationDelegate.h
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

@protocol OperationDelegate <NSObject>

@optional

- (void) webServiceRequestSucceed:(NSInteger)inResponse forRequestClass:(Class)inRequestClass;
- (void) webServiceRequestFailed:(NSError*)inError forRequestClass:(Class)inRequestClass;

@end
