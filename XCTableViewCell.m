//
//  XCTableViewCell.m
//  WYYuanjia
//
//  Created by 云 on 2017/12/18.
//  Copyright © 2017年 yun. All rights reserved.
//

#import "XCTableViewCell.h"
#import "UIView+GetCurrentVC.h"

@implementation XCTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.delegate = self;
}

-(void)xcSetModel:(id)model forIndexPath:(NSIndexPath *)indexPath{

}

-(CGFloat)xctableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}

-(CGFloat)xctableView:(UITableView *)tableView heightForRowAtModel:(id)Model{
    return 0;
}

-(void)dealloc{
    self.delegate = nil;
    self.delegate_ctr = nil;
}

-(UIViewController *)curController{
    if (_curController == nil) {
//        _curController = [self getCurViewController];
    }
    return _curController;
}

@end
