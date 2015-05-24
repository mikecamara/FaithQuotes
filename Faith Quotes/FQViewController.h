//
//  FQViewController.h
//  Faith Quotes
//
//  Created by Mike Camara on 23/09/2014.
//  Copyright (c) 2014 org.mikecamara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>


@class CoolButton;

@interface FQViewController : UIViewController <ADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet ADBannerView *banner;

- (IBAction)showActivityView:(id)sender;
  
@property (nonatomic, strong) IBOutlet CoolButton * coolButton;

- (IBAction)hueValueChanged:(id)sender;
- (IBAction)saturationValueChanged:(id)sender;
- (IBAction)brightnessValueChanged:(id)sender;


@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;

@property (nonatomic, strong) IBOutlet UITextView *quoteText;

- (IBAction)quoteButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UISlider *mySlider;

- (IBAction)sliderValueChanged:(UISlider *)sender;

- (IBAction)tappedNavButton:(id)sender;
@end
