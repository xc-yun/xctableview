//
//  XCTableViewCell.h
//  WYYuanjia
//
//  Created by 云 on 2017/12/18.
//  Copyright © 2017年 yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XCTableViewDelegateCell.h"

@protocol XCTableViewCellDelegate

@optional
-(CGFloat)xctableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

-(CGFloat)xctableView:(UITableView *)tableView heightForRowAtModel:(id)Model;

@end

@interface XCTableViewCell : UITableViewCell<XCTableViewCellDelegate>

//cell使用
@property (nonatomic, weak) id<XCTableViewCellDelegate> delegate;

//controller中使用
@property (nonatomic, weak) id<XCTableViewDelegate_Cell> delegate_ctr;

@property (nonatomic, strong) id parameters;

//当前使用的UIViewController
//@property (nonatomic, strong) UIViewController *curController;

//对每个cell进行赋值
-(void)xcSetModel:(id)model forIndexPath:(NSIndexPath *)indexPath;



@end
