#import <CoreLocation/CoreLocation.h>

@interface LocationManager : NSObject

@property (nonatomic, strong) CLLocation *location;

+(LocationManager*)sharedInstance;
+(void)startUpdating;
+(void)stopUpdating;

@end