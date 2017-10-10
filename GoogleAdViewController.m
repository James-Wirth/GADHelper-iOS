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


+(GoogleAdViewController *)singleton {
    static dispatch_once_t pred;
    static GoogleAdViewController *shared;

    dispatch_once(&pred, ^{
        shared = [[GoogleAdViewController alloc] init];
    });
    return shared;
}

-(void)resetAdView:(UIViewController *)rootViewController {

    currentDelegate_ = rootViewController;
    
    if (isLoaded_) {
        [rootViewController.view addSubview:adBanner_];
    } else {
        
        ad_.delegate = self;
        ad_.rootViewController = rootViewController;
        ad_.adUnitID = kAD_UNIT_ID;
        
        GADRequest *adRequest = [GADRequest request];
       
        //request.testDevices = @[ kGADSimulatorID ];
        [ad_ loadRequest:adRequest];
        [rootViewController.view addSubview:ad_];
        hasLoaded_ = YES;
    }
}

-(id)init {
    if (self = [super init]) {
        ad_ = [[GADBannerView alloc]
                     initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 60, [[UIScreen mainScreen] bounds].size.width, 60)];
        hasLoaded_ = NO;
    }
    return self;
}

@end
