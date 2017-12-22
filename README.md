
原由
------- 
从事ios工作有段时间了，其中UItableView频繁被使用中，这个过程中不断重复的创建加入代理，好麻烦，而且也让viewcontroller代码显的臃肿，因此做了下面的封装

思路
------- 
###1.减少重复工作 
tableview创建的工作做一次

###2.类似的工作作一次
获取数据过程中就把最后需要多少个section，多少个cell的工作做完，后续直接用

###3.是谁的东西就归谁做 
tableviewcell的高度计算，数据填充都让cell自己去做

代码简单使用样例
------- 
简单的一个使用样例</br>
###1.viewcontroller
//数据源填充

```
-(void)createDataSource{
    XCTableViewDataSection *section = [[XCTableViewDataSection alloc] init];
    [section.rowModelsArr addObject:@"1"];
    [section.rowModelsArr addObject:@"2"];
    [section.rowModelsArr addObject:@"3"];
    [section.rowModelsArr addObject:@"4"];
    [self.dataSource.sections addObject:section];
}
```

//cellforrow类似功能

```
-(Class)xctableView:(UITableView *)tableView cellClassAtModel:(id)model{
    return [TableViewCell1 class];
}
```

//tableviewcell的点击事件

```
-(void)xctableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath model:(id)model{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
```
###2.tableviewcell
设置高度

```
-(CGFloat)xctableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
```
赋值

```
-(void)xcSetModel:(id)model forIndexPath:(NSIndexPath *)indexPath{
    _lbName.text = model;
}
```

现有提供的代理
------- 
###1.viewcontroller
```
/************设置tableviewcell *******／
//通过model判断加入不同的tableViewCell
-(Class)xctableView:(UITableView *)tableView cellClassAtModel:(id)model;

//通过indexpath判断加入不同的tableViewCell
-(Class)xctableView:(UITableView *)tableView cellClassAtIndexPath:(NSIndexPath *)indexPath;


/********tableviewcell中操作反馈作用的代理 *******／
-(void)xctableviewCell:(XCTableViewCell *)cell;

-(void)xctableviewCell:(XCTableViewCell *)cell model:(id)model;

-(void)xctableviewCell:(XCTableViewCell *)cell button:(UIButton *)button model:(id)model;
```
###2. tableviewcell
```
/*****提供通过indexpath和数据两种方法判断设置高度 *******／
-(CGFloat)xctableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

-(CGFloat)xctableView:(UITableView *)tableView heightForRowAtModel:(id)Model;

```

扩展的功能
------- 
####1.提供self.dataSource.isXib来设置支持使用xib和纯代码编写的两种cell

####2.tableviewcell提供parameters可以传入请求数据，适用复杂业务需要外层json判断的

准备加入的（等我有空了就加）
-------
####1.tableviewcell中加入curController，获取当前控制器（代码被我注释了，已经有了）
 
####2.重写tableview和datasource方法

####3.对header和footer的封装

