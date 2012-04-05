//
//  GPLExporter.h
//  Pixen
//
//  Created by Collin Sanford on 4/5/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PXPalette.h"

@interface GPLWriter : NSObject

+ (id)sharedGPLWriter;
    
- (NSData *)palDataForPalette:(PXPalette *)palette;

@end
