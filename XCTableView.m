//
//  XCTableView.m
//  WYYuanjia
//
//  Created by 云 on 2017/12/18.
//  Copyright © 2017年 yun. All rights reserved.
//

#import "XCTableView.h"
#import "XCTableViewCell.h"


@implementation XCTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.separatorColor = [UIColor clearColor];
        self.showsVerticalScrollIndicator = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = App_BackgColor;
        
        self.delegate = self;
    }
    return self;
}

-(void)dealloc{
    self.delegate = nil;
    self.dataSource = nil;
}

-(void)setXcDataSource:(id<XCTableViewDataSource>)xcDataSource{
    if (_xcDataSource != xcDataSource) {
        _xcDataSource = xcDataSource;
        self.dataSource = xcDataSource;
    }
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.xcDelegate respondsToSelector:@selector(tableView:estimatedHeightForRowAtIndexPath:)]
        || self.estimatedRowHeight > 0) {
        return UITableViewAutomaticDimension;
    }
    
    id<XCTableViewDataSource> dataSource = (id<XCTableViewDataSource>)self.dataSource;
    id rowModel = [dataSource xctableView:tableView objectForRowAtIndexPath:indexPath];

    Class cellClass;
    if ([dataSource respondsToSelector:@selector(xctableView:cellClassAtModel:)]) {
        cellClass = [dataSource xctableView:tableView cellClassAtModel:rowModel];
    }else{
        cellClass = [dataSource xctableView:tableView cellClassAtIndexPath:indexPath];
    }
    NSString *className = NSStringFromClass(cellClass);
    XCTableViewCell *cell = (XCTableViewCell *)[dataSource xcdequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@%zd", className, indexPath.row]];

    if ([cell respondsToSelector:@selector(xctableView:heightForRowAtIndexPath:)]) {
        return [cell.delegate xctableView:tableView heightForRowAtIndexPath:indexPath];
    } else  if ([cell respondsToSelector:@selector(xctableView:heightForRowAtModel:)]){
        return [cell.delegate xctableView:tableView heightForRowAtModel:rowModel];
    } else{
        return 0;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.xcDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.xcDelegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }else if ([self.xcDelegate respondsToSelector:@selector(xctableView:didSelectRowAtIndexPath:model:)]){
        id<XCTableViewDataSource> dataSource = (id<XCTableViewDataSource>)self.dataSource;
        id rowModel = [dataSource xctableView:tableView objectForRowAtIndexPath:indexPath];
        [self.xcDelegate xctableView:tableView didSelectRowAtIndexPath:indexPath model:rowModel];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.xcDelegate respondsToSelector:@selector(tableView:didDeselectRowAtIndexPath:)]) {
        [self.xcDelegate tableView:tableView didDeselectRowAtIndexPath:indexPath];
    }else if ([self.xcDelegate respondsToSelector:@selector(xctableView:didDeselectRowAtIndexPath:model:)]){
        id<XCTableViewDataSource> dataSource = (id<XCTableViewDataSource>)self.dataSource;
        id rowModel = [dataSource xctableView:tableView objectForRowAtIndexPath:indexPath];
        [self.xcDelegate xctableView:tableView didDeselectRowAtIndexPath:indexPath model:rowModel];
    }
}



@end
