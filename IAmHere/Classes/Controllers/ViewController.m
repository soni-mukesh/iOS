//
//  ViewController.m
//  IAmHere
//
//  Created by Mukesh Soni on 21/12/14.
//  Copyright (c) 2014 Self. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
    
}

#pragma mark LocationManagerNotification

- (void)didUpdateLocation:(NSNotification *)notification {
    NSDictionary *dictLcation = [notification userInfo];
    NSString *location = [dictLcation objectForKey:kLocation];
    [self.lblLocation setText:location];
}

@end
