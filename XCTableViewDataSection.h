//
//  XCTableViewDataSection.h
//  WYYuanjia
//
//  Created by 云 on 2017/12/19.
//  Copyright © 2017年 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

//对应数据填充，tableview安section-row进行填充数据
@interface XCTableViewDataSection : NSObject

//每个secion对应的头部数据
@property (nonatomic , strong) id sectionHeader;

//每个secion对应的底部数据
@property (nonatomic , strong) id sectionFooter;

//每个cell的数据
@property (nonatomic, strong) NSMutableArray *rowModelsArr;


//补充方法，可以直接添加数组
-(instancetype)initWithModelsArray:(NSMutableArray *)Models;

@end
