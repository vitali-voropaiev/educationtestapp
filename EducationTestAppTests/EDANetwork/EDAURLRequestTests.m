//
//  EDAURLRequestTests.m
//  EducationTestApp
//
//  Created by Voropaev Vitali on 09.02.16.
//  Copyright © 2016 Voropaev Vitali. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EDAURLRequest.h"
#import "EDARecordInfoRequest.h"
#import "EDARecordsListRequest.h"

extern NSString *const EDARecordInfoRequestTemplate;
extern NSString *const EDARecordsListRequestTemplate;
extern NSString * const EDAAPIBaseURL;

@interface EDAURLRequestTests : XCTestCase

@end

@implementation EDAURLRequestTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testEDAURLRequest:(EDAURLRequest *)request path:(NSString *)path {
    XCTAssertNotNil(request, @"request not initialized");
    XCTAssertEqual(request.cachePolicy, EDAURLRequestReturnCacheDataElseLoad, @"cachePolicy must be equal to default value EDAURLRequestReturnCacheDataElseLoad");
    XCTAssertEqualObjects(request.HTTPMethod, @"GET", @"request method must be equal to 'GET'");
    
    NSURL *url = [NSURL URLWithString:path relativeToURL:[NSURL URLWithString:EDAAPIBaseURL]];
    XCTAssertTrue([request.URL.absoluteString isEqualToString:url.absoluteString], @"request URL\n %@ must be equal to\n %@",request.URL.absoluteString, url.absoluteString);
}

- (void)testCreateRequestWithPath {
    NSString *path = @"";
    EDAURLRequest *request = [EDAURLRequest requestWithPath:path];
    [self testEDAURLRequest:request path:path];
}

- (void)testEDARecordInfoRequest {
    NSInteger ID = 55;
    EDARecordInfoRequest *request = [EDARecordInfoRequest requestWithId:ID];
    
    NSString *path = [NSString stringWithFormat:EDARecordInfoRequestTemplate, ID];
    [self testEDAURLRequest:request path:path];
    
    XCTAssertTrue([[request valueForHTTPHeaderField:@"Content-Type"] isEqualToString:@"application/json; charset=utf-8"], @"Content type must be application/json");
}

- (void)testEDARecordsListRequest {
    NSInteger start = 55;
    NSInteger count = 23;
    EDARecordsListRequest *request = [EDARecordsListRequest requestFromIndex:start count:count];
    
    NSString *path = [NSString stringWithFormat:EDARecordsListRequestTemplate, start, count];
    [self testEDAURLRequest:request path:path];
    
    XCTAssertTrue([[request valueForHTTPHeaderField:@"Content-Type"] isEqualToString:@"application/json; charset=utf-8"], @"Content type must be application/json");
}

@end
