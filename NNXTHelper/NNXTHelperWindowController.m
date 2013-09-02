//
//  NNXTHelperWindowController.m
//  NNXTHelper
//
//  Created by Morgan Harris on 2/09/13.
//  Copyright (c) 2013 Morgan Harris. All rights reserved.
//

#import "NNXTHelperWindowController.h"

static double multiplierValues[] = { 1/32., 1/16., 1/8., 1/4., 1/24., 1/12. };

@implementation NNXTHelperWindowController

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
    
    //Initialise values
    self.beatsLong = 4;
    self.beatsLongMultiplier = 1/4.;
    self.startPosition = 0;
    self.startPositionMultiplier = 1/4.;
    self.endPosition = 4;
    self.endPositionMultiplier = 1/4.;
    
    // Insert code here to initialize your application
    NSArray* observedKeyPaths = @[@"beatsLong", @"beatsLongMultiplier", @"startPosition", @"startPositionMultiplier", @"endPosition", @"endPositionMultiplier", @"framesLong"];
    
    for (NSString* i in observedKeyPaths) {
        [self addObserver:self forKeyPath:i options:0 context:NULL];
    }
}

- (IBAction)changeSampleLengthMultiplier:(NSPopUpButton *)sender {
    self.beatsLongMultiplier = multiplierValues[ sender.indexOfSelectedItem ];
}

- (IBAction)changeStartMultiplier:(NSPopUpButton *)sender {
    self.startPositionMultiplier = multiplierValues[ sender.indexOfSelectedItem ];
}

- (IBAction)changeEndMultiplier:(NSPopUpButton *)sender {
    self.endPositionMultiplier = multiplierValues[ sender.indexOfSelectedItem ];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self updateStartEndPositionLabels];
}

- (void)setNilValueForKey:(NSString *)key
{
    [self setValue:@0 forKey:key];
}

- (void) updateStartEndPositionLabels {
    double beatsLong = self.beatsLong * self.beatsLongMultiplier;
    double startPos = self.startPosition * self.startPositionMultiplier;
    double endPos = self.endPosition * self.endPositionMultiplier;
    
    startPos /= beatsLong;
    endPos /= beatsLong;
    
    if (self.framesLong) {
        self.startPositionLabel.stringValue = [NSString stringWithFormat:@"%1.2f%% / %1.0f samples", startPos * 100, startPos * self.framesLong];
        self.endPositionLabel.stringValue = [NSString stringWithFormat:@"%1.2f%% / %1.0f samples", endPos * 100, endPos * self.framesLong];
    } else {
        self.startPositionLabel.stringValue = [NSString stringWithFormat:@"%1.2f%%", startPos * 100];
        self.endPositionLabel.stringValue = [NSString stringWithFormat:@"%1.2f%%", endPos * 100];
    }
}

@end
