//
//  GoogleAdViewController.h
//  
//
//  Created by James Wirth on 01/09/2017.
//
//

#import <UIKit/UIKit.h>

@import GoogleMobileAds;

@interface GoogleAdViewController : UIViewController{
    GADBannerView *adBanner_;
    BOOL isLoaded_;
    id currentDelegate_;
}

-(void)resetAdView:(UIViewController *)rootViewController;
+(GADMasterViewController *)singleton;
}

@end
