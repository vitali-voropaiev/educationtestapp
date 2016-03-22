//
//  EDAResponse.h
//  EducationTestApp
//
//  Created by Voropaev Vitali on 04.01.16.
//  Copyright © 2016 Voropaev Vitali. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDAModel.h"

@class EDAResponseMetadata, EDAData;

@interface EDAResponse : EDAModel
@property (nonatomic, strong) EDAResponseMetadata   *meta;
@property (nonatomic, strong) NSArray<EDAData *>    *data;

@end
