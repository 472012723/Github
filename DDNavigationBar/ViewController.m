//
//  ViewController.m
//  DDNavigationBar
//
//  Created by da on 2018/4/10.
//  Copyright © 2018年 wangdada. All rights reserved.
//

#import "ViewController.h"

#define imgHEIGHT 198

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float f = [[UIApplication sharedApplication] statusBarFrame].size.height;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -f, self.view.frame.size.width, self.view.frame.size.height+f) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    self.tableView.contentInset = UIEdgeInsetsMake(imgHEIGHT, 0, 0, 0);
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, -imgHEIGHT, self.view.frame.size.width, imgHEIGHT)];
    imgview.image = [UIImage imageNamed:@"Image"];
    imgview.contentMode = UIViewContentModeScaleAspectFill;///如果不想放大 只想拉长。注释掉这句
    imgview.tag = 101;
    [_tableView addSubview:imgview];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * cellid = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.y < -imgHEIGHT) {
        CGRect rect = [self.tableView viewWithTag:101].frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        
        
        [self.tableView viewWithTag:101].frame = rect;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
