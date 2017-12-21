//
//  XCTableViewDataSource.h
//  WYYuanjia
//
//  Created by 云 on 2017/12/18.
//  Copyright © 2017年 yun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XCTableViewDataSection.h"
#import "XCTableViewDelegateCell.h"

@class XCTableViewCell;
@protocol XCTableViewDataSource<UITableViewDataSource>


@optional
/**
 *通过indexPath获取对应tableViewCell的model数据
 */
- (id)xctableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 *通过model判断加入不同的tableViewCell
 */
-(Class)xctableView:(UITableView *)tableView cellClassAtModel:(id)model;

/**
 *通过indexpath判断加入不同的tableViewCell
 */
-(Class)xctableView:(UITableView *)tableView cellClassAtIndexPath:(NSIndexPath *)indexPath;

/**
 *通过identifier获取对应tableViewCell
 */
-(XCTableViewCell *)xcdequeueReusableCellWithIdentifier:(NSString *)identifier;

@end

@interface XCTableViewDataSource : NSObject<XCTableViewDataSource>

//存储model数据
@property (nonatomic , strong) NSMutableArray *sections;

//存储tableViewCell
@property (nonatomic , strong) NSMutableDictionary *cellDict;

@property (nonatomic, strong) id parameters;

//默认yes 使用xib
@property (nonatomic, assign) BOOL isXib;

@property (nonatomic , weak) UIViewController<XCTableViewDelegate_Cell> *xcdelegate_cell;

@property (nonatomic , weak) UIViewController<XCTableViewDataSource> *xcdelegate_dataSource;



-(void)clearDataSource;

@end
