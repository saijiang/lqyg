//
//  MyViewController.m
//  LQYG
//
//  Created by issuser on 2016/10/19.
//  Copyright © 2016年 JS. All rights reserved.
//

#import "MyViewController.h"
#import "LondingViewController.h"
@interface MyViewController ()

@end

@implementation MyViewController
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)viewWillAppear:(BOOL)animated{
   
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[UIDevice currentDevice].systemVersion floatValue]>=7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
   
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    NSString *str = [defaults objectForKey:@"loading"];
    if (![str isEqualToString:@"loading"]) {
        LondingViewController *loadingControl =[[LondingViewController alloc] init];
        [self.navigationController presentViewController:loadingControl animated:YES completion:nil];
        return;
    
    }
   [self createTable];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    
//    btn.frame = CGRectMake(0, 0, 30, 30);
//    btn.center = self.view.center;
//    [btn addTarget:self action:@selector(loding) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];

    // Do any additional setup after loading the view.
}
//-(void)loding{
//    LondingViewController *loadingControl =[[LondingViewController alloc] init];
//    [self.navigationController presentViewController:loadingControl animated:YES completion:nil];
//}
#pragma mark table
-(void)createTable{
    _arr = @[@{@"image":@"my_hb.png",@"name":@"我的红包",@"selec":@"0个红包"},@{@"image":@"my_db.png",@"name":@"夺宝记录",@"selec":@""},@{@"image":@"my_hj.png",@"name":@"幸运记录",@"selec":@""},@{@"image":@"my_award.png",@"name":@"充值记录",@"selec":@""},@{@"image":@"my_post.png",@"name":@"我的晒单",@"selec":@""},@{@"image":@"my_news.png",@"name":@"我的消息",@"selec":@""},@{@"image":@"my_card.png",@"name":@"我的成绩单",@"selec":@""},@{@"image":@"my_address.png",@"name":@"收货地址",@"selec":@""}];
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToPersonControl) name:@"PersonControl" object:nil];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 220;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
//   MyCusView *sucView = [MyCusView instanceMyCusView];
//    sucView.deleage = self;
    return [MyCusView instanceMyCusView];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    cell.MyImageView.image = [UIImage imageNamed:_arr[indexPath.row][@"image"]];
    cell.MyLabel.text = _arr[indexPath.row][@"name"];
    cell.MyMeLabel.text = _arr[indexPath.row][@"selec"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(void)goToPersonControl{
    PersonViewController *personControl = [[PersonViewController alloc] init];
    [self.navigationController pushViewController:personControl animated:YES];
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
