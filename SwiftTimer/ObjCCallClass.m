//
//  ObjCCallClass.m
//  SwiftTimer
//
//  Created by AK on 12/05/15.
//  Copyright (c) 2015 JetBrains. All rights reserved.
//

#import "ObjCCallClass.h"

@implementation ObjCCallClass

- (void) method {
    NSLog(@"Hello Swift-Timer!");
    NSLog(@"This is %@ and %d", _property, *_dayProperty);
}

- (void)handleStr:(NSString *)str {
    NSLog(@"Given string is %@", str);
}


@end
