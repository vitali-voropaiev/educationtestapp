//
//  EDAImp.m
//  EducationTestApp
//
//  Created by Voropaev Vitali on 02.02.16.
//  Copyright © 2016 Voropaev Vitali. All rights reserved.
//

#import "EDAImp.h"

@interface EDAImp()
@property (nonatomic, readwrite) IMP implementation;

@end

@implementation EDAImp

+ (instancetype)instanceWithImplementation:(IMP)implementation {
    EDAImp *object = [[self alloc] initWithImplementation:implementation];
    
    return object;
}

- (instancetype)initWithImplementation:(IMP)implementation {
    self = [super init];
    if (self) {
        self.implementation = implementation;
    }
    
    return self;
}

@end