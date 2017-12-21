//
//  XCTableViewDataSection.m
//  WYYuanjia
//
//  Created by 云 on 2017/12/19.
//  Copyright © 2017年 yun. All rights reserved.
//

#import "XCTableViewDataSection.h"


@implementation XCTableViewDataSection

- (instancetype)init {
    self = [super init];
    if (self) {
        self.rowModelsArr = [[NSMutableArray alloc] init];
    }
    return self;
}

-(instancetype)initWithModelsArray:(NSMutableArray *)Models {
    self = [self init];
    if (self) {
        [self.rowModelsArr addObjectsFromArray:Models];
    }
    return self;
}


@end
