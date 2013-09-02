//
//  TimingHelperWindowController.h
//  NNXTHelper
//
//  Created by Morgan Harris on 2/09/13.
//  Copyright (c) 2013 Morgan Harris. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TimingHelperWindowController : NSWindowController<NSTableViewDataSource,NSTableViewDelegate>


@property double bpm;
@property (weak) IBOutlet NSTableView *tableView;

@end
