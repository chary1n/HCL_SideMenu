//
//  HCL_ContainerViewController.m
//  Linkloving
//
//  Created by bryantcharyn on 16/3/9.
//  Copyright © 2016年 linkloving. All rights reserved.
//

#import "HCL_ContainerViewController.h"
#import "UIView+CGAExt.h"
@interface HCL_ContainerViewController ()
{
    BOOL isMenuShow;//MENU HIDE OR SHOW;
}
@end

@implementation HCL_ContainerViewController


-(instancetype)initWithMainVC:(UIViewController *)mainVC LeftVC:(HCL_LeftMenuViewController *)leftVC
{
    if (self = [super init]) {
        self.leftVC = leftVC;
        self.mainVC = mainVC;
        isMenuShow = NO;
        [self configUI];
    }
    return self;
}

-(void)configUI
{
    [self.view setUserInteractionEnabled:YES];
    self.view.clipsToBounds = NO;
    [self.view addSubview:self.leftVC.view];
    [self.view addSubview:self.mainVC.view];
    
    [self addChildViewController:self.leftVC];
    [self addChildViewController:self.mainVC];
    
    CGRect leftViewFrame = self.leftVC.view.frame;
    self.leftVC.view.frame = CGRectMake(-leftViewFrame.size.width, 0, leftViewFrame.size.width, leftViewFrame.size.height);
    self.mainVC.view.frame = CGRectMake(0, 0, self.mainVC.view.frame.size.width, self.mainVC.view.frame.size.height);
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureOnMainVC:)]];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    btn.center = self.view.center;
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(ddd) forControlEvents:UIControlEventTouchUpInside];
    [self.mainVC.view addSubview:btn];
    
    self.mainVC.view.layer.shadowOffset = CGSizeMake(-3, 0);
    self.mainVC.view.layer.shadowRadius = 4;
    self.mainVC.view.layer.shadowOpacity = 0.8;//阴影透明度，默认0
    self.mainVC.view.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    [self.mainVC.view.layer setMasksToBounds:NO];
    
}

-(void)ddd
{
}
-(void)panGestureOnMainVC:(UIPanGestureRecognizer *)sender
{
    
    //  获取平移值
    CGPoint translation = [sender translationInView:self.view];
    if (sender.state == UIGestureRecognizerStateBegan) {
    }
    self.mainVC.view.transform = CGAffineTransformTranslate(self.mainVC.view.transform, translation.x, 0);
    self.leftVC.view.ttx=self.mainVC.view.ttx;
    
    
    // 清零移动叠加
    [sender setTranslation:CGPointZero inView:self.view];
    
    //获取右边极限位置
    CGAffineTransform  rightScopeTransform=CGAffineTransformMakeTranslation(self.leftVC.view.frame.size.width, 0);
    
    //右边极限位置
    if (self.mainVC.view.transform.tx > rightScopeTransform.tx) {
        
        self.mainVC.view.transform = rightScopeTransform;
          self.leftVC.view.ttx = self.mainVC.view.ttx;
        
    }else if (self.mainVC.view.transform.tx < 0.0){//左边极限位置
        
        self.mainVC.view.transform=CGAffineTransformMakeTranslation(0, 0);
          self.leftVC.view.ttx=self.mainVC.view.ttx;
        
    }
    //    当托拽手势结束时执行
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            if (self.mainVC.view.x >self.leftVC.view.frame.size.width * 0.5) {
                
                self.mainVC.view.transform=rightScopeTransform;
                
                self.leftVC.view.ttx=self.mainVC.view.ttx;
                
                isMenuShow = YES;
            }
            else
            {
                self.mainVC.view.transform = CGAffineTransformIdentity;
                
                self.leftVC.view.ttx=self.mainVC.view.ttx;
                
                isMenuShow = NO;

            }

        } completion:^(BOOL finished) {
            
        }];

    }
    
}

-(void)showOrHideMainVC
{
    
    CGAffineTransform  rightScopeTransform=CGAffineTransformMakeTranslation(self.leftVC.view.frame.size.width, 0);

    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        if (!isMenuShow) {
        
            self.mainVC.view.transform=rightScopeTransform;
            
            self.leftVC.view.ttx=self.mainVC.view.ttx;
        
        }
        else
        {
            self.mainVC.view.transform = CGAffineTransformIdentity;
            
            self.leftVC.view.ttx=self.mainVC.view.ttx;
        }
        
    } completion:^(BOOL finished) {
        isMenuShow = !isMenuShow;
    }];

}

@end
