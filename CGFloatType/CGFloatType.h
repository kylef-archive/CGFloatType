//
//  CGFloatType.h
//
//  Created by Kyle Fuller on 26/04/2014.
//  Copyright (c) 2014 Kyle Fuller. All rights reserved.
//

@import Foundation;
@import CoreGraphics;

//! Project version number for CGFloatType.
FOUNDATION_EXPORT double CGFloatTypeVersionNumber;

//! Project version string for CGFloatType.
FOUNDATION_EXPORT const unsigned char CGFloatTypeVersionString[];

/// CGFLOAT_EPSILON the minimum positive number such that 1.0 + CGFLOAT_EPSILON != 1.0.
extern CGFloat const CGFLOAT_EPSILON;

#pragma mark - CGFloat conversion

/// Returns a CGFloat from an NSInteger
CGFloat CGFloatWithInteger(NSInteger value);

/// Returns a CGFloat from an NSUInteger
CGFloat CGFloatWithUnsignedInteger(NSUInteger value);

/// Returns a CGFloat from an int
CGFloat CGFloatWithInt(int value);

/// Returns a CGFloat from an unsigned int
CGFloat CGFloatWithUnsignedInt(unsigned int value);

/// Returns a CGFloat from a double
CGFloat CGFloatWithDouble(double value);

/// Returns a CGFloat from a float
CGFloat CGFloatWithFloat(float value);


#pragma mark - NSNumber+CGFloatType

@interface NSNumber (CGFloatType)

/** Creates and returns an NSNumber object containing a given value, treating it as a float or a double depending on your system.
 @param value The value for the new number.
 @return An NSNumber object containing value, treating it as a float or double.
 */
+ (instancetype)numberWithCGFloat:(CGFloat)value;

/** Returns an NSNumber object initialized to contain a given value, treated as a float or a double depending on your system.
 @param value The value for the new number
 @return An NSNumber object containing value, treating it as a float or double.
 */
- (instancetype)initWithCGFloat:(CGFloat)value;

/** Returns the receiver’s value as a CGFloat.
 @return The receiver’s value as a CGFloat, converting it as necessary.
 */
- (CGFloat)CGFloatValue;

@end

#pragma mark - CGFloat Rounding and Remainder Functions

/// Round to smallest integral value not less than x
extern CGFloat ceilCGFloat(CGFloat x);

/// Round to largest integral value less than or equal to x
extern CGFloat floorCGFloat(CGFloat x);

/// Round to closest integral value to x
extern CGFloat roundCGFloat(CGFloat x);

/// Round to the nearest integer towards zero to x. 
extern CGFloat truncCGFloat(CGFloat x);

/// Returns the floating-point remainder of numer/denom
extern CGFloat modCGFloat(CGFloat numer, CGFloat denom);

#pragma mark - CGFloat Trigonometric Functions

/// Computes the cosine of x (measured in radians)
extern CGFloat cosCGFloat(CGFloat x);

/// Computes the sine of x (measured in radians)
extern CGFloat sinCGFloat(CGFloat x);

/// Computes the tangent of x (measured in radians)
extern CGFloat tanCGFloat(CGFloat x);

/// Computes the principle value of the arc cosine of x
extern CGFloat acosCGFloat(CGFloat x);

/// Computes the principle value of the arc sine of x
extern CGFloat asinCGFloat(CGFloat x);

/// Computes the principle value of the arc tangent of x
extern CGFloat atanCGFloat(CGFloat x);

/// Computes the principal value of the arc tangent of y/x, using the signs of both arguments to determine the quadrant of the return value.
extern CGFloat atan2CGFloat(CGFloat y, CGFloat x);

#pragma mark - CGFloat Absolute Value Functions

/// Return the absolute value (magnitude) of x
extern CGFloat absCGFloat(CGFloat x);

#pragma mark - CGFloat Square Root Value Functions

/// Computes the square root of x
extern CGFloat sqrtCGFloat(CGFloat x);

#pragma mark - CGFloat Range Value Functions

/// Returns the minimum value.
extern CGFloat minCGFloat(CGFloat a, CGFloat b);

/// Returns the maximum value.
extern CGFloat maxCGFloat(CGFloat a, CGFloat b);

/// Returns a clamped value with a specified minimum and maximum.
extern CGFloat clampCGFloat(CGFloat x, CGFloat min, CGFloat max);
