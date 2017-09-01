//
//  GoogleAdViewController.m
//  
//
//  Created by James Wirth on 01/09/2017.
//
//

#import "GoogleAdViewController.h"

//Change the value of "yourAdUnitID"
#define kAD_UNIT_ID "yourAdUnitID"

@interface GoogleAdViewController ()

@end

@implementation GoogleAdViewController


+(GADMasterViewController *)singleton {
    static dispatch_once_t pred;
    static GADMasterViewController *shared;

    dispatch_once(&pred, ^{
        shared = [[GADMasterViewController alloc] init];
    });
    return shared;
}

-(void)resetAdView:(UIViewController *)rootViewController {

    currentDelegate_ = rootViewController;
    
    if (isLoaded_) {
        [rootViewController.view addSubview:adBanner_];
    } else {
        
        adBanner_.delegate = self;
        adBanner_.rootViewController = rootViewController;
        adBanner_.adUnitID = kAD_UNIT_ID;;
        
        GADRequest *request = [GADRequest request];
        
        request.testDevices = @[ kGADSimulatorID ];
        [adBanner_ loadRequest:request];
        [rootViewController.view addSubview:adBanner_];
        isLoaded_ = YES;
    }
}

-(id)init {
    if (self = [super init]) {
        adBanner_ = [[GADBannerView alloc]
                     initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 60, [[UIScreen mainScreen] bounds].size.width, 60)];
        isLoaded_ = NO;
    }
    return self;
}

@end
