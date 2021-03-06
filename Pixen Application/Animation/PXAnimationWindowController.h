//
//  PXAnimationWindowController.h
//  Pixen
//
//  Created by Joe Osborn on 2005.08.09.
//  Copyright 2005 Pixen. All rights reserved.
//

#import "PXCanvasWindowController.h"

@class PXAnimation, PXCel, PXFilmStripView;

@interface PXAnimationWindowController : PXCanvasWindowController
{
  @private
	PXAnimation *animation;
	IBOutlet NSSplitView *outerSplitView;
	IBOutlet PXFilmStripView *filmStrip;
	
	IBOutlet NSView *topSubview;
	
	PXCel *activeCel;
	NSInteger activeIndex;
}

@property (nonatomic, assign) PXAnimation *animation;

- (void)activateCel:(PXCel *)cel;
- (IBAction)newCel:(id)sender;
- (IBAction)deleteCel:sender;
- (IBAction)duplicateCel:sender;
- (void)writeCelsAtIndices:(NSIndexSet *)indices toPasteboard:(NSPasteboard *)pboard;

@end
