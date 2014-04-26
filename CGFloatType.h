//
//  CGFloatType.h
//
//  Created by Kyle Fuller on 26/04/2014.
//  Copyright (c) 2014 Kyle Fuller. All rights reserved.
//

#import <Foundation/Foundation.h>

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
