//
//  AppDelegate.h
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "MKNetworkEngine.h"
#import "OperationDelegate.h"

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate, OperationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MKNetworkEngine *network;
@property (nonatomic, assign, getter=isApplicationRunningInForeground) BOOL applicationRunningInForeground;

@end
