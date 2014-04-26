all: tests lint-podspec

tests:
	@xcodebuild -workspace CGFloatType.xcworkspace -scheme 'CGFloatTypeTests' test | xcpretty -c | sed "s/_/ /g"

lint-podspec:
	@pod lib lint CGFloatType.podspec

