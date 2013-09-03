//
//  TimingHelperWindowController.m
//  NNXTHelper
//
//  Created by Morgan Harris on 2/09/13.
//  Copyright (c) 2013 Morgan Harris. All rights reserved.
//

#import "TimingHelperWindowController.h"

static NSArray* _noteLengths;
static double _noteValues[] = { 1, 1/2., 1/4., 1/8., 1/16., 1/32., 1/64., //normals
                                1/12., 1/24., 1/48., 1/96., //triplets
                                3/8., 3/16., 3/32., 3/64., 3/128. //dotted
                                };

@implementation TimingHelperWindowController

+ (void)initialize
{
    _noteLengths = @[@"1/1", @"1/2", @"1/4", @"1/8", @"1/16", @"1/32", @"1/64", @"1/8T", @"1/16T", @"1/32T", @"1/64T", @"1/4D", @"1/8D", @"1/16D", @"1/32D", @"1/64D"];
}

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
    
    [self addObserver:self forKeyPath:@"bpm" options:0 context:NULL];
    
    self.bpm = 120;
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return _noteLengths.count;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    double msperbar = (1/self.bpm) * 60 * 1000 * 4;
    if ([tableColumn.identifier isEqualToString:@"noteLength"]) {
        return _noteLengths[row];
    } else if ([tableColumn.identifier isEqualToString:@"milliseconds"]) {
        return @( msperbar * _noteValues[row] );
    } else if ([tableColumn.identifier isEqualToString:@"frequency"]) {
        return @( 1 / (msperbar / 1000 * _noteValues[row]) );
    }
    return nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"bpm"]) {
        [self.tableView reloadData];
    }
}

@end
