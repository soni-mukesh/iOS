//
//  ViewController.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "ViewController.h"
#import "SubmitLocationOperation.h"

@interface ViewController () <OperationDelegate>

@property(nonatomic, weak) IBOutlet UITextField *txtUserName;
@property(nonatomic, weak) IBOutlet UILabel *lblLocation;
@property(nonatomic, weak) IBOutlet UILabel *lblLastUpdatedInfo;
@property(nonatomic, weak) IBOutlet UIButton *btnSubmit;

-(IBAction)submitUserLocationButtonAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didUpdateLocation:) name:kGotNewLocationNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(IBAction)submitUserLocationButtonAction:(id)sender{
    [SubmitLocationOperation submitLocation:[LocationManager sharedInstance].location forUser:self.txtUserName.text withDelegate:self];
}

#pragma mark LocationManagerNotification

- (void)didUpdateLocation:(NSNotification *)notification {
    NSString *locationStr = [NSString stringWithFormat:@"%f, %f", [LocationManager sharedInstance].location.coordinate.latitude, [LocationManager sharedInstance].location.coordinate.longitude];
    [self.lblLocation setText:locationStr];
}

#pragma mark WebServiceDelegate

- (void) webServiceRequestSucceed:(NSInteger)inResponse forRequestClass:(Class)inRequestClass{
    if (inRequestClass == [SubmitLocationOperation class]) {
        switch (inResponse) {
            case OperationStatusSuccess:
                [Utility showAlertWithMessage:NSLocalizedString(@"SubmitLocationSuccessMsg", nil) withDelegate:nil];
                break;
            case OperationStatusFailure:
                [Utility showAlertWithMessage:NSLocalizedString(@"SubmitLocationErrorMsg", nil) withDelegate:nil];
                break;
            case OperationStatusInvalid:
                [Utility showAlertWithMessage:NSLocalizedString(@"UnknownOperation", nil) withDelegate:nil];
                break;
                
            default:
                break;
        }
    }
}
- (void) webServiceRequestFailed:(NSError*)inError forRequestClass:(Class)inRequestClass{
    if (inRequestClass == [SubmitLocationOperation class]) {
        [Utility showAlertWithMessage:NSLocalizedString(@"SubmitLocationErrorMsg", nil) withDelegate:nil];
    }
}

@end
