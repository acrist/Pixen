//
//  PXPencilToolPropertiesController.m
//  Pixen-XCode

// Copyright (c) 2003,2004,2005 Pixen

// Permission is hereby granted, free of charge, to any person obtaining a copy

// of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation 
// the rights  to use,copy, modify, merge, publish, distribute, sublicense, 
// and/or sell copies of the Software, and to permit persons to whom
//  the Software is  furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
// CONTRACT, TORT OR OTHERWISE, ARISING FROM,  OUT OF OR IN CONNECTION WITH
// THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

//  Created by Ian Henderson on Wed Mar 17 2004.
//  Copyright (c) 2004 Pixen. All rights reserved.
//

#import "PXPencilToolPropertiesController.h"
#import "PXCanvasDocument.h"
#import "PXPattern.h"
#import "PXCanvasController.h"
#import "PXNotifications.h"
#import "PXPatternEditorController.h"

@implementation PXPencilToolPropertiesController

@synthesize lineThickness, pattern = drawingPattern, toolName;

- (NSString *)nibName
{
    return @"PXPencilToolPropertiesView";
}

- (void)setPattern:(PXPattern *)pattern
{
	if (drawingPattern != pattern) {
		drawingPattern = pattern;
		
		[lineThicknessField setEnabled:NO];
		[clearButton setEnabled:YES];
	}
}

- (void)patternEditor:(id)editor finishedWithPattern:(PXPattern *)pattern
{
	if (pattern == nil)
		return;
	
	[self setPattern:pattern];
}

- (NSSize)patternSize
{
	if (drawingPattern != nil) {
		return [drawingPattern size];
	}
	
	return NSZeroSize;
}

- (NSArray *)drawingPoints
{
	return [drawingPattern pointsInPattern];
}

- (IBAction)clearPattern:(id)sender
{
	drawingPattern = nil;
	
	[lineThicknessField setEnabled:YES];
	[clearButton setEnabled:NO];
}

- (IBAction)showPatterns:(id)sender
{
	if (drawingPattern == nil) {
		PXPattern *pattern = [[PXPattern alloc] init];
		[pattern setSize:NSMakeSize([self lineThickness], [self lineThickness])];
		
		int x, y;
		for (x=0; x<[self lineThickness]; x++) {
			for (y=0; y<[self lineThickness]; y++) {
				[pattern addPoint:NSMakePoint(x, y)];
			}
		}
		
		[self setPattern:pattern];
	}
	
	if (!patternEditor) {
		patternEditor = [[PXPatternEditorController alloc] init];
		patternEditor.delegate = self;
		patternEditor.toolName = toolName;
	}
	
	[patternEditor setPattern:drawingPattern];
	[patternEditor showWindow:self];
}

- (void)awakeFromNib
{
	[self clearPattern:nil];
}

- (id)init
{
	self = [super init];
	if (self) {
		self.lineThickness = 1;
	}
	return self;
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
