//
//  UICircularSliderViewController.m
//  UICircularSlider
//
//  Created by Zouhair Mahieddine on 02/03/12.
//  Copyright (c) 2012 Zouhair Mahieddine.
//  http://www.zedenem.com
//  
//  This file is part of the UICircularSlider Library.
//  
//  UICircularProgressView is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//  
//  UICircularProgressView is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with UICircularSlider.  If not, see <http://www.gnu.org/licenses/>.
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
