//
//  AppDelegate.h
//  NNXTHelper
//
//  Created by Morgan Harris on 29/08/13.
//  Copyright (c) 2013 Morgan Harris. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property double beatsLong;
@property double beatsLongMultiplier;
@property double startPosition;
@property double startPositionMultiplier;
@property double endPosition;
@property double endPositionMultiplier;
@property NSUInteger framesLong;

@property (weak) IBOutlet NSTextField *sampleLengthBeatsBarsLabel;

@property (weak) IBOutlet NSTextField *startPositionLabel;
@property (weak) IBOutlet NSTextField *endPositionLabel;

- (IBAction)changeSampleLengthMultiplier:(NSPopUpButton *)sender;
- (IBAction)changeStartMultiplier:(NSPopUpButton *)sender;
- (IBAction)changeEndMultiplier:(NSPopUpButton *)sender;

@end
