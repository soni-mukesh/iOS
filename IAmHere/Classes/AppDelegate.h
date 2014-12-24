#import "MKNetworkEngine.h"
#import "OperationDelegate.h"

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate, OperationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MKNetworkEngine *network;
@property (nonatomic, assign, getter=isApplicationRunningInForeground) BOOL applicationRunningInForeground;

@end
