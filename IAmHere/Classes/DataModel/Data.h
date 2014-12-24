#import <Foundation/Foundation.h>

@interface Data : NSObject

+(Data*)sharedInstance;
-(void) updateLastSubmittedDate:(NSString *)lastSubmittedDate;
-(NSString*) getRelativeTime;

@end
