//
//  MyListViewController.m
//  XUEZHIXING
//
//  Created by LiuQiJia on 16/5/3.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "MyListViewController.h"

@interface MyListViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *mytableView;
    UITableViewCell * mylineCell;
    NSString * CellId ;
}
@end

@implementation MyListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CellId = @"mylist";
    self.view.backgroundColor = [UIColor purpleColor];
    self.navigationController.navigationBar.topItem.title = @"学之星团购平台";
    
    [self addTableView];
    
    [mytableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellId];
    // Do any additional setup after loading the view.
}

-(void)addTableView
{
    mytableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height ) style:UITableViewStyleGrouped];
    mytableView.delegate = self;
    mytableView.dataSource = self;
    [self.view addSubview:mytableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    if (mylineCell == nil) {
        
        mylineCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellId];
    }
    mylineCell.textLabel.text = @"订单商品展示区";
    mylineCell = [mytableView dequeueReusableCellWithIdentifier:CellId];
    mylineCell.backgroundColor = [UIColor whiteColor];
    return mylineCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
