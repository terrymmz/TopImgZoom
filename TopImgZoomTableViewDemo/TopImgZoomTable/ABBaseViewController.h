//
//  ABBaseViewController.h
//  TopImgZoomTableViewDemo
//
//  Created by maxteacherma on 2019/3/7.
//  Copyright © 2019 Ma. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABBaseViewController : UIViewController

- (void)setNavTitle:(NSString *)title color:(UIColor *)color;
- (UIButton *)setNavLeftBtn:(NSString *)title color:(UIColor *)color;
- (UIButton *)setNavRigthBtn:(NSString *)title color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
