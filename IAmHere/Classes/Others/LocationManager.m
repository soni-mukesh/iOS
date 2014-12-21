//
//  LocationManager.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "LocationManager.h"

@interface LocationManager ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

-(void) initiateLocationManager;

@end

@implementation LocationManager

+(LocationManager*)sharedInstance {
    
    static LocationManager* sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        sharedInstance = [[LocationManager alloc] init];
        [sharedInstance initiateLocationManager];
    });
    return sharedInstance;
}

-(void) initiateLocationManager{
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
        [self.locationManager requestWhenInUseAuthorization];
    
}

+(void)startUpdating{
    [[self sharedInstance].locationManager startUpdatingLocation];
}

+(void)stopUpdating{
    [[self sharedInstance].locationManager stopUpdatingLocation];
}

#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSString *locationString = [NSString stringWithFormat:@"%f, %f", location.coordinate.latitude, location.coordinate.longitude];
        [notificationCenter postNotificationName:kGotNewLocationNotification object:nil userInfo:@{kLocation:locationString}];
    });
    
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    DLog(@"Error = %@", error.description);
}
@end