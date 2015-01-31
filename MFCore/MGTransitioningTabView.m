//
//  MGTransitioningTabView.m
//  MacFusion2
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//      http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "MGTransitioningTabView.h"
#import <QuartzCore/QuartzCore.h>


@implementation MGTransitioningTabView
- (id)initWithFrame:(NSRect)frame
{
	if (self = [super initWithFrame: frame]) {
		_viewDimensions = [NSMutableDictionary dictionary];
		[self setAutoresizingMask:NSViewHeightSizable | NSViewWidthSizable];
	}
	
	return self;
}

- (void)addTabViewItem:(NSTabViewItem*)item {
	[_viewDimensions setObject: [NSValue valueWithSize:[[item view] frame].size] forKey:[item label]];
	[super addTabViewItem:item];
}

- (void)drawRect:(NSRect)rect {
	[super drawRect:rect];
	if (_animation != nil) {
		[_transitionFilter setValue:[NSNumber numberWithFloat:[_animation currentValue]] forKey:@"inputTime"];
		CIImage *outputImage = [_transitionFilter valueForKey:@"outputImage"];
		[outputImage drawInRect:_imageRect fromRect:NSMakeRect(0, _imageRect.size.height, _imageRect.size.width, -_imageRect.size.height) operation:NSCompositeSourceOver fraction:1.0];
		 
	}
}

- (void)setTransitionForinitialCIImage:(CIImage *)initialCIImage finalCIImage:(CIImage *)finalCIImage {
	_transitionFilter = [CIFilter filterWithName:@"CIDissolveTransition"];
	[_transitionFilter setDefaults];
	[_transitionFilter setValue:initialCIImage forKey:@"inputImage"];
	[_transitionFilter setValue:finalCIImage forKey:@"inputTargetImage"];
}

- (void)selectTabViewItem:(NSTabViewItem *)tabViewItem {
	[super selectTabViewItem:tabViewItem];
	NSSize newViewSize = [[_viewDimensions objectForKey:[tabViewItem label]] sizeValue];
	[[tabViewItem view] setFrameSize: newViewSize];
}

- (NSSize)sizeWithTabviewItem:(NSTabViewItem *)item {
	NSSize itemSize = [[_viewDimensions objectForKey:[item label]] sizeValue];
	CGFloat deltaX = [self frame].size.width - [self contentRect].size.width;
	CGFloat deltaY = [self frame].size.height - [self contentRect].size.height;
	NSSize sizeToReturn = NSMakeSize(itemSize.width+deltaX, itemSize.height+deltaY);
	return sizeToReturn;
}

@end

@implementation TabViewAnimation

// Override NSAnimation's -setCurrentProgress: method, and use it as our point to hook in and advance our Core Image transition effect to the next time slice.
- (void)setCurrentProgress:(NSAnimationProgress)progress {
    [super setCurrentProgress:progress];
}

@end
