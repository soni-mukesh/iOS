//
//  LocationManager.h
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface LocationManager : NSObject

+(LocationManager*)sharedInstance;
+(void)startUpdating;
+(void)stopUpdating;

@end