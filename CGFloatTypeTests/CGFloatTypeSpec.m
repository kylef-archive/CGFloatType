@import XCTest;
@import Specta;
@import Expecta;
@import CGFloatType;

SpecBegin(CGFloatType)

describe(@"CGFloat constants", ^{
    it(@"epsilon", ^{
#ifdef CGFLOAT_IS_DOUBLE
        expect(CGFLOAT_EPSILON).to.equal(DBL_EPSILON);
#else
        expect(CGFLOAT_EPSILON).to.equal(FLT_EPSILON);
#endif
    });
});

describe(@"CGFloat conversion methods", ^{
    it(@"should convert an NSInteger to a CGFloat", ^{
        NSInteger value = 32;
        CGFloat cgfloat = CGFloatWithInteger(value);

        expect(cgfloat).to.equal(32.0);
    });

    it(@"should convert an NSUInteger to a CGFloat", ^{
        NSUInteger value = 32;
        CGFloat cgfloat = CGFloatWithUnsignedInteger(value);

        expect(cgfloat).to.equal(32.0);
    });

    it(@"should convert an int to a CGFloat", ^{
        int value = 32;
        CGFloat cgfloat = CGFloatWithInt(value);

        expect(cgfloat).to.equal(32.0);
    });
    it(@"should convert an unsigned int to a CGFloat", ^{
        unsigned int value = 32;
        CGFloat cgfloat = CGFloatWithUnsignedInt(value);

        expect(cgfloat).to.equal(32.0);
    });
    it(@"should convert an double to a CGFloat", ^{
        double value = 32.0;
        CGFloat cgfloat = CGFloatWithDouble(value);

        expect(cgfloat).to.equal(32.0);
    });
    it(@"should convert an float to a CGFloat", ^{
        float value = 32.0f;
        CGFloat cgfloat = CGFloatWithFloat(value);

        expect(cgfloat).to.equal(32.0);
    });
});

describe(@"CGFloat comparison methods", ^{
    it(@"should return true when comparing two equal floats", ^{
        BOOL equals = CGFloatEquals(CGFloatWithFloat(0.7f), CGFloatWithFloat(0.7f));
        expect(equals).to.beTruthy();
    });

    it(@"should return true when comparing two equal doubles", ^{
        BOOL equals = CGFloatEquals(CGFloatWithDouble(0.7), CGFloatWithDouble(0.7));
        expect(equals).to.beTruthy();
    });

    it(@"should return false when comparing numbers with diferent precisions", ^{
        BOOL equals = CGFloatEquals(CGFloatWithFloat(0.7f), CGFloatWithDouble(0.7));
        expect(equals).to.beFalsy();
    });
});

describe(@"NSNumber", ^{
    it(@"should create a number with a CGFloat", ^{
        NSNumber *number = [NSNumber numberWithCGFloat:CGFLOAT_MAX];

        expect(number).notTo.beNil();
        expect([number CGFloatValue]).to.equal(CGFLOAT_MAX);
    });

    it(@"should initialize with a CGFloat", ^{
        NSNumber *number = [[NSNumber alloc] initWithCGFloat:CGFLOAT_MAX];

        expect(number).notTo.beNil();
        expect([number CGFloatValue]).to.equal(CGFLOAT_MAX);
    });
});

describe(@"CGFloat Rounding and Remainder Functions", ^{
    it(@"should round to smallest integral value not greater than CGFloat x", ^{
        CGFloat value = floorCGFloat(5.2);
        expect(value).to.equal(5.0);
    });

    it(@"should round to largest integral valuel ess than or equal to CGFloat x", ^{
        CGFloat value = ceilCGFloat(5.2);
        expect(value).to.equal(6.0);
    });
    
    it(@"should round to the closest (smallest in this case) integral to CGFloat x", ^{
        CGFloat value = roundCGFloat(5.2);
        expect(value).to.equal(5.0);
    });
    
    it(@"should round to the closest (largest in this case) integral to CGFloat x", ^{
        CGFloat value = roundCGFloat(5.6);
        expect(value).to.equal(6.0);
    });
    
    it(@"should round to the nearest integer (smallest in this case) towards zero to CGFloat x", ^{
        CGFloat value = truncCGFloat(5.7);
        expect(value).to.equal(5.0);
    });
    
    it(@"should round to the nearest integer (largest in this case) towards zero to CGFloat x", ^{
        CGFloat value = truncCGFloat(-5.7);
        expect(value).to.equal(-5.0);
    });

    it(@"should return the remainder", ^{
        CGFloat value = modCGFloat(1.5, 3);
        expect(value).to.equal(1.5);
    });
});

describe(@"CGFloat trigonometric functions", ^{
    it(@"should compute the cosine of a CGFloat", ^{
        CGFloat value = cosCGFloat(CGFLOAT_MAX);
        expect(value).to.equal(-0.9999876894265599);

#if CGFLOAT_IS_DOUBLE
        expect(value).to.equal(-0.9999876894265599);
#endif
    });

    it(@"should compute the sine of a CGFloat", ^{
        CGFloat value = sinCGFloat(CGFLOAT_MAX);

#if CGFLOAT_IS_DOUBLE
        expect(value).to.equal(0.004961954789184061);
#endif
    });

    it(@"should compute the tangent of a CGFloat", ^{
        CGFloat value = tanCGFloat(CGFLOAT_MAX);

#if CGFLOAT_IS_DOUBLE
        expect(value).to.equal(-0.004962015874444894);
#endif
    });

    it(@"should compute the principle value of a CGFloat arc cosine", ^{
        CGFloat value = acosCGFloat(1);

#if CGFLOAT_IS_DOUBLE
        expect(value).to.equal(0);
#endif
    });

    it(@"should compute the principle value of a CGFloat arc sine", ^{
        CGFloat value = asinCGFloat(0);

#if CGFLOAT_IS_DOUBLE
        expect(value).to.equal(0);
#endif
    });

    it(@"should compute the principle value of a CGFloat arc tangent", ^{
        CGFloat value = atanCGFloat(1);

#if CGFLOAT_IS_DOUBLE
        expect(value).to.equal(0.7853981633974483);
#endif
    });

    it(@"should compute the principal value of the CGFloat arc tangent of y/x", ^{
        CGFloat value = atan2CGFloat(5, 5);

#if CGFLOAT_IS_DOUBLE
        expect(value).to.equal(0.7853981633974483);
#endif
    });
});

describe(@"CGFloat absolute value functions", ^{
    it(@"should compute the absolute value of a CGFloat", ^{
        CGFloat value = absCGFloat(-0.123);
        expect(value).to.equal(0.123);
    });
});

describe(@"CGFloat square root functions", ^{
  it(@"should compute the square root of a CGFloat", ^{
    CGFloat value = sqrtCGFloat(9.0);
    expect(value).to.equal(3.0);
  });
});

describe(@"CGFloat Range Value Functions", ^{
    it(@"should compute the minimum value of a CGFloat", ^{
        CGFloat value = minCGFloat(0.0, 0.5);
        expect(value).to.equal(0.0);
    });

    it(@"should compute the maximum value of a CGFloat", ^{
        CGFloat value = maxCGFloat(0.0, 0.5);
        expect(value).to.equal(0.5);
    });

    it(@"should clamp to the lowest the value of a CGFloat", ^{
        CGFloat value = clampCGFloat(0.0, 0.5, 1.0);
        expect(value).to.equal(0.5);
    });

    it(@"should clamp to the highest the value of a CGFloat", ^{
        CGFloat value = clampCGFloat(1.2, 0.5, 1.0);
        expect(value).to.equal(1.0);
    });

    it(@"should not alter the value if within clamp range", ^{
        CGFloat value = clampCGFloat(0.5, 0.0, 1.0);
        expect(value).to.equal(0.5);
    });
});

SpecEnd
