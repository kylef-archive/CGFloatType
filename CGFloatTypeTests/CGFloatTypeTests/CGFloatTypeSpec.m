//
//  CGFloatTypeSpec.h
//
//  Created by Kyle Fuller on 26/04/2014.
//  Copyright (c) 2014 Kyle Fuller. All rights reserved.
//

#define EXP_SHORTHAND YES
#import <XCTest/XCTest.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <CGFloatType/CGFloatType.h>

SpecBegin(CGFloatType)

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

SpecEnd
