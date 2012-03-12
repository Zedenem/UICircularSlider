//
//  UICircularSliderViewController.m
//  UICircularSlider
//
//  Created by Zouhair Mahieddine on 02/03/12.
//  Copyright (c) 2012 Zouhair Mahieddine. All rights reserved.
//

#import "UICircularSliderViewController.h"
#import "UICircularSlider.h"

@interface UICircularSliderViewController ()

@property (unsafe_unretained, nonatomic) IBOutlet UISlider *slider;
@property (unsafe_unretained, nonatomic) IBOutlet UIProgressView *progressView;
@property (unsafe_unretained, nonatomic) IBOutlet UICircularSlider *circularSlider;

@end

@implementation UICircularSliderViewController
@synthesize slider = _slider;
@synthesize progressView = _progressView;
@synthesize circularSlider = _circularSlider;

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.circularSlider addTarget:self action:@selector(updateProgress:) forControlEvents:UIControlEventValueChanged];
	[self.circularSlider setMinimumValue:self.slider.minimumValue];
	[self.circularSlider setMaximumValue:self.slider.maximumValue];
}

- (void)viewDidUnload {
	[self setProgressView:nil];
	[self setCircularSlider:nil];
	[self setSlider:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (IBAction)updateProgress:(UISlider *)sender {
	float progress = translateValueFromSourceIntervalToDestinationInterval(sender.value, sender.minimumValue, sender.maximumValue, 0.0, 1.0);
	[self.progressView setProgress:progress];
	[self.circularSlider setValue:sender.value];
	[self.slider setValue:sender.value];
}


@end
