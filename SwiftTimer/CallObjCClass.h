//
//  CallObjCClass.h
//  SwiftTimer
//
//  Created by AK on 12/05/15.
//  Copyright (c) 2015 JetBrains. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, WeekDays) {
    Monday,
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
    Sunday
};

@interface CallObjCClass : NSObject

@property (strong, nonatomic) NSString *property;
@property (nonatomic) WeekDays *dayProperty;

- (void) method;
- (void) handleStr:(NSString *)str;

@end

