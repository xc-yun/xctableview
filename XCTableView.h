//
//  XCTableView.h
//  WYYuanjia
//
//  Created by 云 on 2017/12/18.
//  Copyright © 2017年 yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCTableViewDataSource.h"

@protocol XCTableViewDelegate<UITableViewDelegate>

@optional
//tableviewcell的点击选中事件
-(void)xctableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath model:(id)model;

//tableviewcell的反选事件
-(void)xctableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath model:(id)model;
@end


@interface XCTableView : UITableView<UITableViewDelegate>

@property (nonatomic, weak) id <XCTableViewDataSource> xcDataSource;
@property (nonatomic, weak) id <XCTableViewDelegate> xcDelegate;

@end
