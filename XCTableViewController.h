//
//  XCTableViewController.h
//  WYYuanjia
//
//  Created by 云 on 2017/12/18.
//  Copyright © 2017年 yun. All rights reserved.
//

#import "DWParentVC.h"

#import "XCTableView.h"

@class XCTableViewDataSource;


@interface XCTableViewController : DWParentVC<XCTableViewDelegate, XCTableViewDataSource>

@property (nonatomic , strong) XCTableView *tableView;
@property (nonatomic , strong) XCTableViewDataSource *dataSource;



@end
