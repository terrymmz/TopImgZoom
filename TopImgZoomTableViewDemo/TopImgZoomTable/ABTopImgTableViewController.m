//
//  ABTopImgTableViewController.m
//  TopImgZoomTableViewDemo
//
//  Created by maxteacherma on 2019/3/6.
//  Copyright © 2019 Ma. All rights reserved.
//

#import "ABTopImgTableViewController.h"
#import "ABNavigationController.h"

#define kSWidth [UIScreen mainScreen].bounds.size.width
#define kSHeight [UIScreen mainScreen].bounds.size.height
#define kTableViewCellHeight 60.f
#define kImageViewScale (300/533.f)
#define kNavBarHeigth 64.f


@interface ABTopImgTableViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>{
    NSArray *_dataArr;
    ABTopImgZoomTableView *_mainTableView;
    
    UIImageView *_imgView;
    CGRect _imgViewRect;
    
    UIView *_navBar;
}

@end

@implementation ABTopImgTableViewController

- (void)viewWillAppear:(BOOL)animated {
    _mainTableView.contentOffset = CGPointMake(0, 0);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _dataArr = @[@"1",@"2",@"3",@"1",@"2",@"3",@"1",@"2",@"3",@"1",@"2",@"3"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creaetNav];
    CGFloat height = kSWidth*kImageViewScale;
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kSWidth, height)];
    _imgView.image = [UIImage imageNamed:@"TestImg1"];
    _imgViewRect = _imgView.frame;
    [self.view addSubview:_imgView];
    
    _mainTableView = [[ABTopImgZoomTableView alloc] initWithFrame:CGRectMake(0, kNavBarHeigth, kSWidth, kSHeight-kNavBarHeigth)];
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.postionY = height - kNavBarHeigth;
    [self.view addSubview:_mainTableView];
    
}

- (void)creaetNav{
    ABNavigationController *navController = (ABNavigationController *)self.navigationController;
    [navController setNavBarColor:[UIColor clearColor]];
    [self setNavTitle:@"主页" color:[UIColor whiteColor]];
    [self setNavLeftBtn:@"左边按钮" color:[UIColor whiteColor]];
    [self setNavRigthBtn:@"右边按钮" color:[UIColor whiteColor]];
}


#pragma mark - UITableViewDelegate,UITableViewDataSource -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  kTableViewCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _dataArr[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

#pragma mark - UIScrollViewDelegate -

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    ABNavigationController *navController = (ABNavigationController *)self.navigationController;
    NSLog(@"%lf",y);
    if (y < 0) {
        CGFloat imgHeight = _imgViewRect.size.height - y;
        _imgView.frame = ({
            CGRect frame = CGRectMake(-(imgHeight/kImageViewScale - kSWidth)/2, 0, imgHeight/kImageViewScale, imgHeight);
            frame;
        });
    }
    if (y > 0) {
        _imgView.frame = ({
            CGRect frame = CGRectMake(0, -y, _imgViewRect.size.width, _imgViewRect.size.height);
            frame;
        });
        if ((64 > (_imgViewRect.size.height - y))&&(_imgViewRect.size.height - y)>0) {
            [self setNavTitle:@"主页(1)" color:[UIColor blackColor]];
            [self setNavRigthBtn:@"右边按钮(1)" color:[UIColor blackColor]];
            [self setNavLeftBtn:@"左边按钮(2)" color:[UIColor blackColor]];
            [navController setNavBarColor:[UIColor colorWithRed:188/255.f green:188/255.f blue:188/255.f alpha:1-(_imgViewRect.size.height - y)/64.f]];
            NSLog(@"%f",(_imgViewRect.size.height - y)/64.f);
        }
        else if (64 < (_imgViewRect.size.height - y)){
            [navController setNavBarColor:[UIColor clearColor]];
            [self setNavTitle:@"主页" color:[UIColor whiteColor]];
            [self setNavRigthBtn:@"右边按钮" color:[UIColor whiteColor]];
            [self setNavLeftBtn:@"左边按钮" color:[UIColor whiteColor]];
        }
    }
    
}

@end

