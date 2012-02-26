//
//  PXAnimationBackgroundView.h
//  Pixen
//
//  Copyright 2005-2012 Pixen Project. All rights reserved.
//

@interface PXAnimationBackgroundView : NSView
{
  @private
	NSGradient *_horizontalGradient;
	NSScrollView *_filmStrip;
}

@property (nonatomic, strong) IBOutlet NSScrollView *filmStrip;

@end
