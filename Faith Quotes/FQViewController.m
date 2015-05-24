//
//  FQViewController.m
//  Faith Quotes
//
//  Created by Mike Camara on 23/09/2014.
//  Copyright (c) 2014 org.mikecamara. All rights reserved.
//

#import "FQViewController.h"
#import "CoolButton.h"


@interface FQViewController ()



@end

@implementation FQViewController

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}






@synthesize quoteText;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ad
    self.banner.delegate = self;

    
    [self becomeFirstResponder];

    
    self.mySlider.minimumValue = 12;
    self.mySlider.maximumValue = 33;
    
    
    
    // 1 - Add array of personal quotes
    self.myQuotes = @[
                      @"Live and let live",
                      @"Don't cry over spilt milk",
                      @"Always look on the bright side of life",
                      @"Nobody's perfect",
                      @"Can't see the woods for the trees",
                      @"Better to have loved and lost then not loved at all",
                      @"The early bird catches the worm",
                      @"As slow as a wet week"
                      ];
    
    // 2 - Load movie quotes
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    
    
    self.movieQuotes= [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    
    [quoteText setFont:[UIFont fontWithName:@"Verdana" size:18]];
	[quoteText setBackgroundColor:[UIColor clearColor]];
	[quoteText setTextColor:[UIColor blackColor]];

    //choose the color of the gradient
    [self setBackgroundGradient:self.view color1Red:190.0 color1Green:219.0 color1Blue:249.0 color2Red:23.0 color2Green:26.0 color2Blue:29.0 alpha:1.0];

    
    int array_tot = [self.movieQuotes count];
    // 2 - Get random index
    int index = (arc4random() % array_tot);
    // 3 - Get the quote string for the index
    //NSString *my_quote = [self.myQuotes objectAtIndex:index];
    NSString *my_quote = self.movieQuotes[index][@"quote"];
    NSString *my_author = self.movieQuotes[index][@"source"];
    // 4 - Display the quote in the text view
    self.quoteText.text = [NSString stringWithFormat:@"\"%@\" %@",  my_quote, my_author];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//add action to button
-(IBAction)quoteButtonTapped:(id)sender {
    // 1 - Get number of rows in array
    int array_tot = [self.movieQuotes count];
    // 2 - Get random index
    int index = (arc4random() % array_tot);
    // 3 - Get the quote string for the index
    //NSString *my_quote = [self.myQuotes objectAtIndex:index];
    NSString *my_quote = self.movieQuotes[index][@"quote"];
    NSString *my_author = self.movieQuotes[index][@"source"];
    // 4 - Display the quote in the text view
    self.quoteText.text = [NSString stringWithFormat:@"\"%@\" %@",  my_quote, my_author];
    
}


//add action to slider
- (IBAction)sliderValueChanged:(id)sender {
    
    UISlider *slider = (UISlider *)sender;
    NSInteger val = lround(slider.value);
    [quoteText setFont:[UIFont fontWithName:@"Verdana" size:val]];
}




//change background color to gradient
- (void)setBackgroundGradient:(UIView *)mainView color1Red:(float)colorR1 color1Green:(float)colorG1 color1Blue:(float)colorB1 color2Red:(float)colorR2 color2Green:(float)colorG2 color2Blue:(float)colorB2 alpha:(float)alpha
{
    
    [mainView setBackgroundColor:[UIColor clearColor]];
    CAGradientLayer *grad = [CAGradientLayer layer];
    grad.frame = mainView.bounds;
    
    grad.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:colorR1/255.0 green:colorG1/255.0 blue:colorB1/255.0 alpha:alpha] CGColor], (id)[[UIColor colorWithRed:colorR2/255.0 green:colorG2/255.0 blue:colorB2/255.0 alpha:alpha] CGColor], nil];
    
    [mainView.layer insertSublayer:grad atIndex:0];
}


//change the quote shaking the device
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if ( event.subtype == UIEventSubtypeMotionShake )
    {
        //your code
        int array_tot = [self.movieQuotes count];
        // 2 - Get random index
        int index = (arc4random() % array_tot);
        // 3 - Get the quote string for the index
        //NSString *my_quote = [self.myQuotes objectAtIndex:index];
        NSString *my_quote = self.movieQuotes[index][@"quote"];
        // 4 - Display the quote in the text view
        self.quoteText.text = [NSString stringWithFormat:@"\"%@\"",  my_quote ];
    }
    
    if ( [super respondsToSelector:@selector(motionEnded:withEvent:)] )
        [super motionEnded:motion withEvent:event];
}
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

//method to Restrict orientation changes
-(BOOL) shouldAutorotate {
    return NO;
}


//add activity to sharing button
- (IBAction)showActivityView:(id)sender {
    
    NSString *shareText = quoteText.text;
    NSArray *itemsToShare = @[shareText,@"#FaithQuotesApp"];
              UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:itemsToShare  applicationActivities:nil];
    activityVC.excludedActivityTypes = @[];
    [self presentViewController:activityVC animated:YES completion:nil];
    
}

- (IBAction)tappedNavButton:(id)sender {
    FQViewController *secondViewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"FQViewController"];
    [self.navigationController pushViewController:secondViewController animated:YES];
}

//add advertising to the botton of the page
//- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
//{
//    return YES;
//}
//
//- (void)bannerViewDidLoadAd:(ADBannerView *)banner
//{
//}
//
//- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
//{
//}

@end
