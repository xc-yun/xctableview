//
//  XCTableViewDataSource.m
//  WYYuanjia
//
//  Created by 云 on 2017/12/18.
//  Copyright © 2017年 yun. All rights reserved.
//

#import "XCTableViewDataSource.h"
#import "XCTableViewCell.h"

@interface XCTableViewDataSource()

@end

@implementation XCTableViewDataSource

-(instancetype)init{
    self = [super init];
    if (self) {
        self.sections = [NSMutableArray array];
        self.cellDict = [NSMutableDictionary dictionary];
        self.isXib = YES;
    }
    return self;
}


#pragma mark - TableViewDataSource扩展代理方法
-(Class)xctableView:(UITableView *)tableView cellClassAtModel:model{
    if ([self.xcdelegate_dataSource respondsToSelector:@selector(xctableView:cellClassAtModel:)]) {
        return [self.xcdelegate_dataSource xctableView:tableView cellClassAtModel:model];
    }
    
    return [XCTableViewCell class];
}

-(Class)xctableView:(UITableView *)tableView cellClassAtIndexPath:indexPath{
    if ([self.xcdelegate_dataSource respondsToSelector:@selector(xctableView:cellClassAtIndexPath:)]) {
        return [self.xcdelegate_dataSource xctableView:tableView cellClassAtIndexPath:indexPath];
    }
    return [XCTableViewCell class];
}

-(id)xctableView:(UITableView *)tableView objectForRowAtIndexPath:(NSIndexPath *)indexPath{
    XCTableViewDataSection *sectionData = self.sections[indexPath.section];
    return sectionData.rowModelsArr[indexPath.row];
}

-(XCTableViewCell *)xcdequeueReusableCellWithIdentifier:(NSString *)identifier{
    return [self.cellDict objectForKey:identifier];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.sections.count) {
        XCTableViewDataSection *sectionData = self.sections[section];
        return sectionData.rowModelsArr.count;
    }
    return 0;
}

//获取dataSource数据和每个row对应的cell进行赋值
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id rowModel = [self xctableView:tableView objectForRowAtIndexPath:indexPath];
    
    Class cellClass;
    
    if ([self respondsToSelector:@selector(xctableView:cellClassAtModel:)] || [self.xcdelegate_dataSource respondsToSelector:@selector(xctableView:cellClassAtModel:)]) {
        cellClass = [self xctableView:tableView cellClassAtModel:rowModel];
    } else {
        cellClass = [self xctableView:tableView cellClassAtIndexPath:indexPath];
    }
    
    NSString *className = NSStringFromClass(cellClass);
    XCTableViewCell *cell = (XCTableViewCell *)[tableView dequeueReusableCellWithIdentifier:className];
    if (!cell) {
        if (self.isXib) {
            cell = [[[NSBundle mainBundle]loadNibNamed:className owner:nil options:nil]lastObject];
            [cell setValue:className forKeyPath:@"reuseIdentifier"];
        }else{
            cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:className];
        }
        
        
        [self.cellDict setObject:cell forKey:[NSString stringWithFormat:@"%@%zd", className, indexPath.row]];
        
        if (self.xcdelegate_cell) {
            cell.delegate_ctr = self.xcdelegate_cell;
        }else{

        }
    }

    cell.parameters = self.parameters;
    [cell xcSetModel:rowModel forIndexPath:indexPath];
    return cell;
}


#pragma mark Private
-(void)clearDataSource{
    [self.sections removeAllObjects];
    self.cellDict = nil;
    self.cellDict = [NSMutableDictionary dictionary];
}

-(void)dealloc{
    self.xcdelegate_cell = nil;
}

@end
