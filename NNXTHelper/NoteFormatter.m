//
//  NoteFormatter.m
//  MIDITranslator
//
//  Created by Morgan Harris on 27/08/13.
//  Copyright (c) 2013 Morgan Harris. All rights reserved.
//

#import "NoteFormatter.h"

@implementation NoteFormatter

static NSArray* keys = nil;
static NSArray* flats = nil;

+ (void)initialize
{
    keys = @[@"C", @"C#", @"D", @"D#", @"E", @"F", @"F#", @"G", @"G#", @"A", @"A#", @"B"];
}

- (NSString *)stringForObjectValue:(id)obj
{
    
    if ([obj isKindOfClass:[NSNumber class]]) {
        NSNumber* n = (NSNumber*) obj;
        int note = n.intValue;
        
        if ((note < 0) || (note > 127)) {
            return nil;
        }
        
        int octave = note / 12;
        octave--; // octaves actually start at -1
        
        int key = note % 12;
        NSString* keystr = [keys objectAtIndex:key];
        
        return [NSString stringWithFormat:@"%@%i",keystr,octave];
        
    }
    
    return nil;
}

- (BOOL)getObjectValue:(out __autoreleasing id *)obj forString:(NSString *)string errorDescription:(out NSString *__autoreleasing *)error
{
    //parse string
    
    NSScanner* scanner = [NSScanner scannerWithString:[string uppercaseString]];
    
    NSString *keystr;
    int octave;
    
    BOOL rslt = YES;
    
    rslt &= [scanner scanUpToCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@"-0123456789"] intoString:&keystr];
    rslt &= [scanner scanInt:&octave];
    
    if (rslt == NO) {
        if (error != NULL) {
            *error = @"Not a valid note string";
        }
        return NO;
    }
    
    if ((octave < -1) || (octave > 9)) {
        if (error != NULL) {
            *error = @"Not a valid octave";
        }
        return NO;
    }
    
    NSUInteger key = [keys indexOfObject:keystr];
    
    if (key == NSNotFound) {
        if (error != NULL) {
            *error = @"Not a valid note key";
        }
        return NO;
    }
    
    NSUInteger note = (octave + 1) * 12 + key;
    
    *obj = @(note);
    
    return YES;
}

@end
