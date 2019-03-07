//
//  ABNavigationController.m
//  TopImgZoomTableViewDemo
//
//  Created by maxteacherma on 2019/3/6.
//  Copyright © 2019 Ma. All rights reserved.
//

#import "ABNavigationController.h"

#define kSWidth [UIScreen mainScreen].bounds.size.width
#define kNavHeight 64.f
#define kStateBarHeight 20.f

@interface ABNavigationController (){
    UIView *_barView;
}

@end

@implementation ABNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self.navigationBar setShadowImage:[UIImage new]];
        [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setNavBarColor:(UIColor *)navBarColor{
    _navBarColor = navBarColor;
    if (!_barView) {
        _barView = [[UIView alloc] initWithFrame:CGRectMake(0, -kStateBarHeight, kSWidth, kNavHeight)];
        [self.navigationBar addSubview:_barView];
        [self.navigationBar sendSubviewToBack:_barView];
    }
    _barView.backgroundColor = navBarColor;
}


@end
