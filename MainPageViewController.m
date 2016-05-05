//
//  MainPageViewController.m
//  XUEZHIXING
//
//  Created by LiuQiJia on 16/5/3.
//  Copyright © 2016年 LiuQiJia. All rights reserved.
//

#import "MainPageViewController.h"
#import "RightCollectionViewCell.h"
#import "LeftTableViewCell.h"
#import "ColloctionDetailVC.h"

#define SCR_SIZE [UIScreen mainScreen].bounds.size
#define SCR_OR [UIScreen mainScreen].bounds.origin

@interface MainPageViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    UIPageControl * adPageController;
    
    UIScrollView * adScrollview;
    
    UITableView * leftTabelView;
    
    UICollectionView * rightcollection;
    int tempChangeImageVeiw;
    
    RightCollectionViewCell* rightCollectionCell;
    LeftTableViewCell * leftTableCell;
    NSString * collectionID;
    
    NSString * cellID;
    int numberOfTableViewCell;
    int numberOfColloctionCell;
    NSArray * tableViewCellText;
    ColloctionDetailVC * detailVC;
    
    
}

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationController.navigationBar.topItem.title = @"学之星团购平台";
    
    numberOfTableViewCell = 8;
    numberOfColloctionCell = 10;
    
    [self addScrollView:3];
    [self creatTableViewText];
    
    
    //展示入口
    [self showPersonalInformation:1000 level:[NSString stringWithFormat:@"院长"] personNumber:10];
    
    
    //左侧tableview
    cellID = @"ID";
    leftTabelView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 64+SCR_SIZE.height/4+10,SCR_SIZE.width/3+20 ,SCR_SIZE.height-(64+SCR_SIZE.height/4+40-10) ) style:UITableViewStylePlain];
    
    leftTabelView.backgroundColor = [UIColor whiteColor];
    leftTabelView.delegate = self;
    leftTabelView.dataSource = self;
    leftTabelView.tableFooterView = [[UITableViewCell alloc] init];
    [leftTabelView registerClass:[LeftTableViewCell class] forCellReuseIdentifier:cellID];
    
    
    [self.view addSubview:leftTabelView];
    
    //右侧collection
    collectionID = @"collectionID";
    [self addCollectionView];
    
}
- (void)creatTableViewText
{
    tableViewCellText = @[@"粮油",@"蔬菜调料",@"鱼肉蛋类",@"服装被褥",@"办公用品",@"生活用品",@"学习用品",@"旅游保险",@"其它"];
    
}

/*
 广告插件,adnumber代表广告个数
 */
- (void)addScrollView:(int)adnumeber
{
    
    adScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0,64, SCR_SIZE.width, SCR_SIZE.height/4)];
    adScrollview.delegate = self;
    adScrollview.backgroundColor = [UIColor grayColor];
    adScrollview.bounces = YES;
    adScrollview.showsHorizontalScrollIndicator = NO;
    adScrollview.pagingEnabled = YES;
    adScrollview.contentSize = CGSizeMake(SCR_SIZE.width*adnumeber, 0);
    int i = 0;
    
#pragma  mark -广告图片添加处
    while (i<3) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*SCR_SIZE.width,0, SCR_SIZE.width, SCR_SIZE.height/5)];
        i++;
        imageView.backgroundColor = [UIColor redColor];
        imageView.image = [UIImage imageNamed:@"团购图标8副本"];
        [adScrollview addSubview:imageView];
    }
    
    
    adPageController = [[UIPageControl alloc] initWithFrame:CGRectMake(SCR_SIZE.width - 50, SCR_SIZE.height/5 - 20+65, 20, 20)];
    adPageController.numberOfPages = adnumeber;
    adPageController.currentPageIndicatorTintColor = [UIColor greenColor];
    
    UIView * spaceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCR_SIZE.width, SCR_SIZE.height/5)];
    spaceView.backgroundColor = [UIColor clearColor];
    [self.view insertSubview:spaceView aboveSubview:adScrollview];
    [self.view addSubview:adScrollview];
    [self.view insertSubview:adPageController aboveSubview:adScrollview];
}

#pragma  mark - 轮播定时器
- (void)addTimer{
         self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    }

- (void)removeTimer
 {
        [self.timer invalidate];
 }

- (void)nextImage
{
    CGFloat j =(SCR_SIZE.width);
    CGFloat h = adScrollview.contentOffset.x;
    if (j<=(SCR_SIZE.width*3)) {
      h = j++;
    }
    
}


#pragma mark - scrollview代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    adPageController.currentPage = scrollView.contentOffset.x/SCR_SIZE.width;
}


#pragma mark - 个人信息展示
- (void)showPersonalInformation:(int)score level:(NSString *)level personNumber:(int)personNumber
{
    UILabel * showLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 65+SCR_SIZE.height/5, SCR_SIZE.width, 40)];
    
    showLabel.text = [NSString stringWithFormat:@" 当 前 积 分 ：%d    级别 ： %@     成 员 数 ：%d",score,level,personNumber];
    
    showLabel.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:showLabel];
}

#pragma mark - tableview协议方法

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    leftTableCell = [leftTabelView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (leftTableCell == 0)
    {
       
        leftTableCell = [[LeftTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    leftTableCell.nameLabel.text = tableViewCellText[indexPath.row];
    leftTableCell.cellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"团购分类%d副本",((int)indexPath.row+1)]];

    return leftTableCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark - 左侧控制collection点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
#pragma mark - 点击改变图片处
    [rightcollection removeFromSuperview];
    [self reloadInputViews];
//    tempChangeImageVeiw = (int) indexPath.row;
    [self addCollectionView];
    tempChangeImageVeiw = (int) indexPath.row;

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return numberOfTableViewCell;
}

#pragma mark -collection添加入口
- (void)addCollectionView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(SCR_SIZE.width/3, SCR_SIZE.width/3);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 10;
    
    layout.sectionInset = UIEdgeInsetsMake(2, 5, 2, 5);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    float collectionWidth = SCR_SIZE.width/3*2-20;
    float collectionHeight =SCR_SIZE.height/4*3-120;
    float collectionY = SCR_SIZE.height/4+74;
    float collectionX =SCR_SIZE.width/3+20;
    
    rightcollection = [[UICollectionView alloc] initWithFrame:CGRectMake(collectionX, collectionY, collectionWidth, collectionHeight) collectionViewLayout:layout];
    rightcollection.showsVerticalScrollIndicator = YES;
    rightcollection.showsHorizontalScrollIndicator = NO;
    rightcollection.delegate = self;
    rightcollection.dataSource = self;
    rightcollection.scrollEnabled  = YES;
    rightcollection.backgroundColor = [UIColor blueColor];
    
    [rightcollection registerClass:[RightCollectionViewCell class] forCellWithReuseIdentifier:collectionID];
    [self.view addSubview:rightcollection];
}



#pragma mark - collection代理方法
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
#pragma mark -更改图片数字
    rightCollectionCell = [rightcollection dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
    rightCollectionCell.imageNum = tempChangeImageVeiw;

    if (rightCollectionCell == nil) {
        rightCollectionCell = [[RightCollectionViewCell alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        rightCollectionCell.backgroundColor = [UIColor darkGrayColor];
    }
    
    return rightCollectionCell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    detailVC = [[ColloctionDetailVC alloc] init];
    detailVC.view.frame = CGRectMake(0, SCR_SIZE.height/4+24, SCR_SIZE.width, SCR_SIZE.height - SCR_SIZE.width/4);
    
    //[self.navigationController pushViewController:detailVC animated:YES];
    
    [self.view addSubview:detailVC.view];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
    
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCR_SIZE.width/3*2-20)/2-10,150);
    
}

- (void)didReceiveMemoryWarning
{
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
