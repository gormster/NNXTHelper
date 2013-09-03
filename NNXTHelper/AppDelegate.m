//
//  AppDelegate.m
//  NNXTHelper
//
//  Created by Morgan Harris on 29/08/13.
//  Copyright (c) 2013 Morgan Harris. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.nnxtController = [[NNXTHelperWindowController alloc] initWithWindowNibName:@"NNXTHelper"];
    
    self.pitchController = [[PitchBendHelperWindowController alloc] initWithWindowNibName:@"PitchBendHelper"];
    
    self.timingController = [[TimingHelperWindowController alloc] initWithWindowNibName:@"TimingHelper"];
}

- (IBAction)helperMenuClick:(NSMenuItem *)sender {
    
    static NSArray* helpers;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helpers = @[self.nnxtController, self.pitchController, self.timingController];
    });
    NSWindowController* helper = helpers[sender.tag];
    
    if (helper.window.isMainWindow) {
        [helper close];
        sender.state = NSOffState;
    } else {
        [helper showWindow:self];
        sender.state = NSOnState;
    }
}

- (IBAction)launchButtonClick:(NSButton *)sender {
    static NSArray* helpers;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helpers = @[self.nnxtController, self.pitchController, self.timingController];
    });
    NSWindowController* helper = helpers[sender.tag];
    
    [helper showWindow:self];
}

- (void)setAlwaysOnTop:(BOOL)alwaysOnTop
{
    _alwaysOnTop = alwaysOnTop;
    
    if (_alwaysOnTop) {
        self.nnxtController.window.level = NSFloatingWindowLevel;
        self.pitchController.window.level = NSFloatingWindowLevel;
        self.timingController.window.level = NSFloatingWindowLevel;
    } else {
        self.nnxtController.window.level = NSNormalWindowLevel;
        self.pitchController.window.level = NSNormalWindowLevel;
        self.timingController.window.level = NSNormalWindowLevel;
    }
    
}
@end
