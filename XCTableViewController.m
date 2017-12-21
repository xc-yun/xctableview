//
//  XCTableViewController.m
//  WYYuanjia
//
//  Created by 云 on 2017/12/18.
//  Copyright © 2017年 yun. All rights reserved.
//

#import "XCTableViewController.h"

@interface XCTableViewController ()

@end

@implementation XCTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    XCTableViewDataSource *dataSource = [[XCTableViewDataSource alloc] init];
    dataSource.xcdelegate_dataSource = self;
    self.dataSource = dataSource;
    
    
    self.tableView = [[XCTableView alloc]initWithFrame:CGRectMake(0, kNavi_Height, kScreenWidth, kScreenHeight- kNavi_Height)];
    self.tableView.xcDelegate = self;
    self.tableView.xcDataSource = self.dataSource;
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dealloc{
    self.tableView.xcDelegate = nil;
    self.tableView.xcDataSource = nil;
}



@end
