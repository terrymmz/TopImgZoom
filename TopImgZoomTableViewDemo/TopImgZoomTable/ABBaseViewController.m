//
//  ABBaseViewController.m
//  TopImgZoomTableViewDemo
//
//  Created by maxteacherma on 2019/3/7.
//  Copyright © 2019 Ma. All rights reserved.
//

#import "ABBaseViewController.h"

@interface ABBaseViewController (){
    UILabel *_navTitleLabel;
    UIButton *_leftBtn;
    UIButton *_rightBtn;
}

@end

@implementation ABBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)setNavTitle:(NSString *)title color:(UIColor *)color {
    if (!_navTitleLabel) {
        _navTitleLabel = [[UILabel alloc] init];
        self.navigationItem.titleView = _navTitleLabel;
    }
    _navTitleLabel.text = title;
    _navTitleLabel.textColor = color;
    [_navTitleLabel sizeToFit];
}

- (UIButton *)setNavLeftBtn:(NSString *)title color:(UIColor *)color {
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    }
    [_leftBtn setTitle:title forState:UIControlStateNormal];
    [_leftBtn setTitleColor:color forState:UIControlStateNormal];
    [_leftBtn sizeToFit];
    return _leftBtn;
}

- (UIButton *)setNavRigthBtn:(NSString *)title color:(UIColor *)color {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    }
    [_rightBtn setTitle:title forState:UIControlStateNormal];
    [_rightBtn setTitleColor:color forState:UIControlStateNormal];
    [_rightBtn sizeToFit];
    return _rightBtn;
}

@end
