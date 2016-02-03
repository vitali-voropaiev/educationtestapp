//
//  NSObject+SubclassesTests.m
//  EducationTestApp
//
//  Created by Voropaev Vitali on 19.01.16.
//  Copyright © 2016 Voropaev Vitali. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+EDARuntime.h"

@interface NSObject_SubclassesTests : XCTestCase

@end

@implementation NSObject_SubclassesTests

- (void)testNSObjectMetaclass {
    Class class = [NSMutableDictionary class];
    Class metaclass = [[NSMutableDictionary metaclass] metaclass];
    NSLog(@"Metaclass for %@ is %@", NSStringFromClass(class), NSStringFromClass(metaclass));
}

- (void)testCreateEDACustomClass {
    NSString *customClassName = @"EDATestClass";
    Class class = [self registerClassWithName:customClassName kindOf:[NSObject class]];
    XCTAssertNotNil(class, @"Class %@ not registered", customClassName);
    
    id object = [class new];
    
    XCTAssertNotNil(object, @"Class %@ not initialized", customClassName);
    XCTAssertTrue([object isMemberOfClass:class], @"Object must be member of %@ class", customClassName);
    XCTAssertTrue([object isKindOfClass:[NSObject class]], @"Object must be kind of %@ class", [NSObject class]);
    
    object = nil;
    [self unregisterClassWithName:customClassName];
}

#pragma mark -
#pragma mark Register/Unregister class

- (Class)registerClassWithName:(NSString *)name kindOf:(Class)class {
    Class newClass = objc_allocateClassPair(class, [name UTF8String], 0);
    objc_registerClassPair(newClass);
    return newClass;
}

- (void)unregisterClassWithName:(NSString *)name {
    objc_disposeClassPair(NSClassFromString(name));
}

@end
