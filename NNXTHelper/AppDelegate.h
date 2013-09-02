//
//  AppDelegate.h
//  NNXTHelper
//
//  Created by Morgan Harris on 29/08/13.
//  Copyright (c) 2013 Morgan Harris. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NNXTHelperWindowController.h"
#import "PitchBendHelperWindowController.h"
#import "TimingHelperWindowController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property NNXTHelperWindowController* nnxtController;
@property PitchBendHelperWindowController* pitchController;
@property TimingHelperWindowController* timingController;

@property (nonatomic) BOOL alwaysOnTop;

- (IBAction)helperMenuClick:(NSMenuItem *)sender;
- (IBAction)launchButtonClick:(NSButton *)sender;

@end
