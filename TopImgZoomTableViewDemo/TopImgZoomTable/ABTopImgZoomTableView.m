//
//  ABTopImgZoomTableView.m
//  TopImgZoomTableViewDemo
//
//  Created by maxteacherma on 2019/3/6.
//  Copyright © 2019 Ma. All rights reserved.
//

#import "ABTopImgZoomTableView.h"

#define kSWidth [UIScreen mainScreen].bounds.size.width
#define kSHeight [UIScreen mainScreen].bounds.size.height

@interface ABTopImgZoomTableView (){
    UIView *_headerView;
}

@end

@implementation ABTopImgZoomTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)setPostionY:(CGFloat)postionY {
    _postionY = postionY;
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        self.tableHeaderView = _headerView;
        _headerView.backgroundColor = [UIColor clearColor];
    }
    _headerView.frame = CGRectMake(0, 0, kSWidth, postionY);
}


@end
