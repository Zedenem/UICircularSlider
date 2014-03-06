//
///  UICircularSlider.h
///  UICircularSlider
//
//  Created by Zouhair Mahieddine on 02/03/12.
//  Copyright (c) 2012 Zouhair Mahieddine.
//  http://www.zedenem.com
//  
//  This file is part of the UICircularSlider Library, released under the MIT License.
//

#if ! __has_feature(objc_arc)
#warning This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

#import <UIKit/UIKit.h>

/** @name Constants */
/**
 * The styles permitted for the circular progress view.
 *
 * You can set and retrieve the current style of progress view through the progressViewStyle property.
 */
typedef enum {
	UICircularSliderStyleCircle,
	UICircularSliderStylePie,
} UICircularSliderStyle;

@interface UICircularSlider : UIControl

/**
 * The current value of the receiver.
 *
 * Setting this property causes the receiver to redraw itself using the new value.
 * If you try to set a value that is below the minimum or above the maximum value, the minimum or maximum value is set instead. The default value of this property is 0.0.
 */
@property (nonatomic) float value;

/**
 * The minimum value of the receiver.
 * 
 * If you change the value of this property, and the current value of the receiver is below the new minimum, the current value is adjusted to match the new minimum value automatically.
 * The default value of this property is 0.0.
 */
@property (nonatomic) float minimumValue;

/**
 * The maximum value of the receiver.
 * 
 * If you change the value of this property, and the current value of the receiver is above the new maximum, the current value is adjusted to match the new maximum value automatically.
 * The default value of this property is 1.0.
 */
@property (nonatomic) float maximumValue;

/**
 * The color shown for the portion of the slider that is filled.
 */
@property(nonatomic, retain) UIColor *minimumTrackTintColor;

/**
 * The color shown for the portion of the slider that is not filled.
 */
@property(nonatomic, retain) UIColor *maximumTrackTintColor;

/**
 * The color used to tint the standard thumb.
 */
@property(nonatomic, retain) UIColor *thumbTintColor;

/**
 * Contains a Boolean value indicating whether changes in the sliders value generate continuous update events.
 *
 * If YES, the slider sends update events continuously to the associated target’s action method.
 * If NO, the slider only sends an action event when the user releases the slider’s thumb control to set the final value.
 * The default value of this property is YES.
 */
@property(nonatomic, getter=isContinuous) BOOL continuous;

/**
 * The current graphical style of the receiver.
 *
 * The value of this property is a constant that specifies the style of the slider.
 The default style is UICircularSliderStyleCircle.
 * For more on these constants, see UICircularSliderStyle.
 */
@property (nonatomic) UICircularSliderStyle sliderStyle;

@end


/** @name Utility Functions */
#pragma mark - Utility Functions
/**
 * Translate a value in a source interval to a destination interval
 * @param sourceValue					The source value to translate
 * @param sourceIntervalMinimum			The minimum value in the source interval
 * @param sourceIntervalMaximum			The maximum value in the source interval
 * @param destinationIntervalMinimum	The minimum value in the destination interval
 * @param destinationIntervalMaximum	The maximum value in the destination interval
 * @return	The value in the destination interval
 *
 * This function uses the linear function method, a.k.a. resolves the y=ax+b equation where y is a destination value and x a source value
 * Formulas :	a = (dMax - dMin) / (sMax - sMin)
 *				b = dMax - a*sMax = dMin - a*sMin
 */
float translateValueFromSourceIntervalToDestinationInterval(float sourceValue, float sourceIntervalMinimum, float sourceIntervalMaximum, float destinationIntervalMinimum, float destinationIntervalMaximum);
/**
 * Returns the smallest angle between three points, one of them clearly indicated as the "junction point" or "center point".
 * @param centerPoint	The "center point" or "junction point"
 * @param p1			The first point, member of the [centerPoint p1] segment
 * @param p2			The second point, member of the [centerPoint p2] segment
 * @return				The angle between those two segments
 
 * This function uses the properties of the triangle and arctan (atan2f) function to calculate the angle.
 */
CGFloat angleBetweenThreePoints(CGPoint centerPoint, CGPoint p1, CGPoint p2);