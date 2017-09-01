# GADHelper-iOS
## Usage ##
1. Import the files 'GoogleAdViewController.h' and 'GoogleAdViewController.m' into your XCode project.

2. Download the Google Mobile Ads SDK (https://developers.google.com/admob/ios/download) and import the framework into your project.

3. In the view controllers where you want to display the ad banner, use:

`GoogleAdViewController *vc = [GoogleAdViewController singleton];`

`[vc resetAdView:self];`

4. N.B. Remember to alter the AD UNIT ID at the top of the GoogleAdViewController.m to your ad unit id.
