#import "Data.h"

@interface Data ()

@property (nonatomic, strong) NSDate *lastSubmittedDate;

-(void)initiateData;
-(NSDate*) dateFromString:(NSString*) dateString;

@end

@implementation Data

+(Data*)sharedInstance {
    
    static Data* sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken,^{
        sharedInstance = [[Data alloc] init];
        [sharedInstance initiateData];
    });
    return sharedInstance;
}

-(void)initiateData{
    if ([Utility getValueFromPermanentStoreForKey:kLastSubmittedKey]) {
        self.lastSubmittedDate = [self dateFromString:[Utility getValueFromPermanentStoreForKey:kLastSubmittedKey]];
    }else{
        self.lastSubmittedDate = [NSDate new];
    }
}

-(void) updateLastSubmittedDate:(NSString *)lastSubmittedDate{

    self.lastSubmittedDate = [self dateFromString:lastSubmittedDate];
    [Utility saveToPermanentStoreValue:lastSubmittedDate forKey:kLastSubmittedKey];
}

-(NSDate*) dateFromString:(NSString*) dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss zzz"];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}
-(NSString*) getRelativeTime{
    
    NSTimeInterval relativeTime = [self.lastSubmittedDate timeIntervalSinceNow];
    NSInteger timeInterval = -(relativeTime);
    NSString *relativeTimeAsString;
    
    if(timeInterval > (60*60*24)){
        NSInteger days = floor(timeInterval/(60*60*24));
        relativeTimeAsString = [NSString stringWithFormat:@"Last Submitted %ld Days ago", (long)days];
    }else if (timeInterval > (60*60)) {
        NSInteger hours = floor(timeInterval/(60*60));
        relativeTimeAsString = [NSString stringWithFormat:@"Last Submitted %ld Hours ago", (long)hours];
    }else if(timeInterval > 60){
        NSInteger minutes = floor(timeInterval/60);
        relativeTimeAsString = [NSString stringWithFormat:@"Last Submitted %ld Minutes ago", (long)minutes];
    }else{
        NSInteger remainingSeconds = round(timeInterval%60);
        relativeTimeAsString = [NSString stringWithFormat:@"Last Submitted %ld Seconds ago", (long)remainingSeconds];
    }
    return relativeTimeAsString;
}

@end

