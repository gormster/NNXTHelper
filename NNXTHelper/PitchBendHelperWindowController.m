//
//  PitchBendHelperWindowController.m
//  NNXTHelper
//
//  Created by Morgan Harris on 2/09/13.
//  Copyright (c) 2013 Morgan Harris. All rights reserved.
//

#import "PitchBendHelperWindowController.h"

@interface PitchBendHelperWindowController ()

@end

@implementation PitchBendHelperWindowController

@dynamic secondNote;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.pitchBendRange = 7;
    self.firstNote = 60;
    
    [self addObserver:self forKeyPath:@"semitones" options:0 context:NULL];
}

- (void)setSecondNote:(NSUInteger)secondNote
{
    NSInteger semitoneChange = secondNote - self.firstNote;
    self.semitones = semitoneChange;
}

- (NSUInteger)secondNote
{
    return self.firstNote + self.semitones;
}

+ (NSSet *)keyPathsForValuesAffectingSecondNote
{
    return [NSSet setWithObjects:@"firstNote", @"semitones", nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"semitones"]) {
        NSInteger v = 8192.0 / (double)self.pitchBendRange * (double)self.semitones;
        self.valueLabel.stringValue = [NSString stringWithFormat:@"%04li", (long)v];
    }
}

@end
