//
//  PitchBendHelperWindowController.h
//  NNXTHelper
//
//  Created by Morgan Harris on 2/09/13.
//  Copyright (c) 2013 Morgan Harris. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PitchBendHelperWindowController : NSWindowController
@property (weak) IBOutlet NSTextField *valueLabel;

@property NSUInteger pitchBendRange;
@property NSInteger semitones;

@property (nonatomic) NSUInteger firstNote;
@property (nonatomic) NSUInteger secondNote;

@end
