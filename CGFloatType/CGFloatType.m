//
//  CGFloatType.m
//
//  Created by Kyle Fuller on 26/04/2014.
//  Copyright (c) 2014 Kyle Fuller. All rights reserved.
//

#import "CGFloatType.h"

#ifdef CGFLOAT_IS_DOUBLE
CGFloat const CGFLOAT_EPSILON = DBL_EPSILON;
#else
CGFloat const CGFLOAT_EPSILON = FLT_EPSILON;
#endif

#pragma mark - CGFloat Conversion

CGFloat CGFloatWithInteger(NSInteger value) {
    return [@(value) CGFloatValue];
}

CGFloat CGFloatWithUnsignedInteger(NSUInteger value) {
    return [@(value) CGFloatValue];
}

CGFloat CGFloatWithInt(int value) {
    return [@(value) CGFloatValue];
}

CGFloat CGFloatWithUnsignedInt(unsigned int value) {
    return [@(value) CGFloatValue];
}

CGFloat CGFloatWithDouble(double value) {
#if CGFLOAT_IS_DOUBLE
    return value;
#else
    return [@(value) CGFloatValue];
#endif
}

CGFloat CGFloatWithFloat(float value) {
#if CGFLOAT_IS_DOUBLE
    return [@(value) CGFloatValue];
#else
    return value;
#endif
}

#pragma mark - CGFloat NSNumber

@implementation NSNumber (CGFloatType)

+ (instancetype)numberWithCGFloat:(CGFloat)value {
#if CGFLOAT_IS_DOUBLE
    return [self numberWithDouble:value];
#else
    return [self numberWithFloat:value];
#endif
}

- (instancetype)initWithCGFloat:(CGFloat)value {
#if CGFLOAT_IS_DOUBLE
    return [self initWithDouble:value];
#else
    return [self initWithFloat:value];
#endif
}

- (CGFloat)CGFloatValue {
#if CGFLOAT_IS_DOUBLE
    return [self doubleValue];
#else
    return [self floatValue];
#endif
}

@end

#pragma mark - CGFloat Rounding and Remainder Functions

CGFloat ceilCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return ceil(x);
#else
    return ceilf(x);
#endif
}

extern CGFloat floorCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return floor(x);
#else
    return floorf(x);
#endif
}

extern CGFloat roundCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return round(x);
#else
    return roundf(x);
#endif	
}

extern CGFloat truncCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return trunc(x);
#else
    return truncf(x);
#endif	
}

extern CGFloat modCGFloat(CGFloat numer, CGFloat denom) {
#if CGFLOAT_IS_DOUBLE
    return fmod(numer, denom);
#else
    return fmodf(numer, denom);
#endif
}

#pragma mark - CGFloat Trigonometric Functions

CGFloat cosCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return cos(x);
#else
    return cosf(x);
#endif
}

CGFloat sinCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return sin(x);
#else
    return sinf(x);
#endif
}

CGFloat tanCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return tan(x);
#else
    return tanf(x);
#endif
}

CGFloat acosCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return acos(x);
#else
    return acosf(x);
#endif
}

CGFloat asinCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return asin(x);
#else
    return asinf(x);
#endif
}

CGFloat atanCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return atan(x);
#else
    return atanf(x);
#endif
}

CGFloat atan2CGFloat(CGFloat y, CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return atan2(y, x);
#else
    return atan2f(y, x);
#endif
}

#pragma mark - CGFloat Absolute Value Functions

CGFloat absCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
    return fabs(x);
#else
    return fabsf(x);
#endif
}

#pragma mark - CGFloat Square Root Value Functions

CGFloat sqrtCGFloat(CGFloat x) {
#if CGFLOAT_IS_DOUBLE
  return sqrt(x);
#else
  return sqrtf(x);
#endif
}

#pragma mark - CGFloat Range Value Functions

CGFloat minCGFloat(CGFloat a, CGFloat b) {
#if CGFLOAT_IS_DOUBLE
    return fmin(a, b);
#else
    return fminf(a, b);
#endif
}

CGFloat maxCGFloat(CGFloat a, CGFloat b) {
#if CGFLOAT_IS_DOUBLE
    return fmax(a, b);
#else
    return fmaxf(a, b);
#endif
}

CGFloat clampCGFloat(CGFloat x, CGFloat min, CGFloat max) {
#if CGFLOAT_IS_DOUBLE
    return fmax(min, fmin(x, max));
#else
    return fmaxf(min, fminf(x, max));
#endif
}
