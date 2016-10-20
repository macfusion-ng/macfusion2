.PHONY: MacFusion2 debug clean

MacFusion2:
	xcodebuild -project "MacFusion2.xcodeproj" -target All -configuration "Release" $(XC_OPTIONS) build

debug:
	xcodebuild -project "MacFusion2.xcodeproj" -target All -configuration "Debug" $(XC_OPTIONS) build

clean:
	@rm -rf ./build
