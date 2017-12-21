//
//  XCTableViewDelegateCell.h
//  WYYuanjia
//
//  Created by 云 on 2017/12/20.
//  Copyright © 2017年 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XCTableViewCell;

//需要特殊处理可以增加代理方法实现
@protocol XCTableViewDelegate_Cell

@optional

-(void)xctableviewCell:(XCTableViewCell *)cell;


-(void)xctableviewCell:(XCTableViewCell *)cell model:(id)model;


-(void)xctableviewCell:(XCTableViewCell *)cell button:(UIButton *)button model:(id)model;

@end
