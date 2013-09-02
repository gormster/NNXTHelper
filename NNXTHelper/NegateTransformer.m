//
//  NegateTransformer.m
//  NNXTHelper
//
//  Created by Morgan Harris on 2/09/13.
//  Copyright (c) 2013 Morgan Harris. All rights reserved.
//

#import "NegateTransformer.h"

@implementation NegateTransformer

+ (Class)transformedValueClass
{
    return [NSNumber class];
}

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

- (id)transformedValue:(id)value
{
    NSNumber* n = (NSNumber*)value;
    return @(-n.doubleValue);
}

@end