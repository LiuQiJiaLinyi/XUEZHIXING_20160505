//
//  ColloctionDetailVC.m
//  XUEZHIXING
//
//  Created by LiuQiJia on 16/5/4.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "ColloctionDetailVC.h"

@interface ColloctionDetailVC ()
{
    UILabel * topLabel;
    UIImageView * searchImage;
    UIButton * backbutton;
    UISearchBar * collectionDetailsearchBar;
}
@end

@implementation ColloctionDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    topLabel.backgroundColor = [UIColor lightGrayColor];
    topLabel.userInteractionEnabled =YES;
    
    searchImage = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width -50, 0, 50, 50)];
    searchImage.image = [UIImage imageNamed:@"团购图标2副本"];
    
    backbutton  = [[UIButton alloc] initWithFrame:CGRectMake(10, 9, 50, 40)];
    backbutton.backgroundColor = [UIColor redColor];
    backbutton.layer.cornerRadius = 5;
    [backbutton addTarget:self action:@selector(backMainView) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:topLabel];
    [self.view addSubview:backbutton];
    [self.view addSubview:searchImage];
    
    [self addsearcherBar];
    // Do any additional setup after loading the view.
}

-(void)addsearcherBar
{
    collectionDetailsearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(80, 9, [UIScreen mainScreen].bounds.size.width/3*2, 40)];
    collectionDetailsearchBar.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:collectionDetailsearchBar];
    
}

- (void)backMainView
{
    NSLog( @"返回按钮点击事件触发");
    [self.view removeFromSuperview];
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
