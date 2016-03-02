//
//  EDAResponse.m
//  EducationTestApp
//
//  Created by Voropaev Vitali on 04.01.16.
//  Copyright © 2016 Voropaev Vitali. All rights reserved.
//

#import "EDAResponse.h"
#import "EDAResponseMetadata.h"
#import "EDAData.h"
#import "EDADefines.h"

@implementation EDAResponse

+ (instancetype)instanceWithDictionary:(NSDictionary *)dictionary {
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        EDAResponse *response = [EDAResponse new];
        response.meta = [EDAResponseMetadata instanceWithDictionary:dictionary[@"meta"]];
        response.data = [EDAData arrayFromArray:dictionary[@"data"]];
        
        return response;
    }
    
    return nil;
}

@end
