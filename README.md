# CGFloatType

[![Build Status](https://img.shields.io/circleci/project/kylef/CGFloatType/master.svg)](https://circleci.com/gh/kylef/CGFloatType)

It's easy to forget that `CGFloat` may actually be a `double` despite it's
name. On 64-bit systems, where `CGFLOAT_IS_DOUBLE` is set to 1 it will actually
be a double.

This may become cumbersome when you are developing an application where you
want a single code base which builds for both 32-bit and 64-bit such as when
developing against the 32-bit simulator and deploying arm64.

CGFloatType is a simple library which provides methods on `NSNumber` to help
deal with this. Along with providing various math and rounding functions
which accepts `CGFloat`.

This helps you change:

```objective-c
#if CGFLOAT_IS_DOUBLE
  CGFloat points = ceil(pointsPerMinute * durationMinutes);
#else
  CGFloat points = ceilf(pointsPerMinute * durationMinutes);
#endif
```

Into something like:

```objective-c
CGFloat points = ceilCGFloat(pointsPerMinute * durationMinutes);
```

## Usage

```objective-c
#import <CGFloatType/CGFloatType.h>

@implementation Example

- (void)example {
    NSNumber *number = [NSNumber numberWithCGFloat:CGRectGetHeight(self.view.frame)];
    NSLog(@"NSNumber with value: %@", number);
    CGFloat value = [number CGFloatValue];

    CGFloat floorValue = floorCGFloat(value);
    CGFloat ceilValue = ceilCGFloat(value);

    NSLog(@"%@ (floor = %@, ceil = %@)", @(value), @(floorValue), @(ceilValue));
}

@end
```

## Installation

### Podfile

```ruby
pod 'CGFloatType'
```

## License

CGFloatType is released under the BSD license. See [LICENSE](LICENSE).

