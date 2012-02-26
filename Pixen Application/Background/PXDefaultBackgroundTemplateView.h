//
//  PXDefaultBackgroundTemplateView.h
//  Pixen
//
//  Copyright 2005-2012 Pixen Project. All rights reserved.
//

#import "PXBackgroundTemplateView.h"

@interface PXDefaultBackgroundTemplateView : PXBackgroundTemplateView
{
  @private
	NSString *_backgroundTypeText;
	BOOL _activeDragTarget;
}

@property (nonatomic, strong) NSString *backgroundTypeText;
@property (nonatomic, assign) BOOL activeDragTarget;

@end
