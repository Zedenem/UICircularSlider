//
//  UICircularSliderViewController.m
//  UICircularSlider
//
//  Created by Zouhair Mahieddine on 02/03/12.
//  Copyright (c) 2012 Zouhair Mahieddine.
//  http://www.zedenem.com
//  
//  This file is part of the UICircularSlider Library, released under the MIT License.
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
    [self.circularSlider addTarget:self action:@selector(sliderTouchedDown:) forControlEvents:UIControlEventTouchDown];
    [self.circularSlider addTarget:self action:@selector(sliderTouchedUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.circularSlider addTarget:self action:@selector(sliderTouchedUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
	self.circularSlider.minimumValue = self.slider.minimumValue;
	self.circularSlider.maximumValue =self.slider.maximumValue;
    self.circularSlider.continuous = NO;
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

- (IBAction)sliderTouchedDown:(id)sender {
    self.view.backgroundColor = [UIColor grayColor];
}

- (IBAction)sliderTouchedUpInside:(id)sender {
    self.view.backgroundColor = [UIColor lightGrayColor];
}
- (IBAction)sliderTouchedUpOutside:(id)sender {
    self.view.backgroundColor = [UIColor greenColor];
}


@end
