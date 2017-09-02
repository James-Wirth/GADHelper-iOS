# Shared GADBannerViews with GADHelper-iOS
## Implementing a shared GADBannerView  ##

The following steps will enable the same ad banner to remain across all view controllers (without changing after every segue)

1. Import the files 'GoogleAdViewController.h' and 'GoogleAdViewController.m' into your XCode project. *N.B. Remember to alter the AD UNIT ID at the top of the GoogleAdViewController.m to your ad unit id.*

2. Download the Google Mobile Ads SDK (https://developers.google.com/admob/ios/download) and import the framework into your project.

3. In the view controllers where you want to display the ad banner, use:

`GoogleAdViewController *vc = [GoogleAdViewController singleton];`

`[vc resetAdView:self];`

4. Add `[GADMobileAds configureWithApplicationID:@"YOUR-APP-ID"];` into the didFinishLaunching method in AppDelegate.m

