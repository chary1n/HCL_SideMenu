//
//  HCL_LeftMenuViewController.m
//  Linkloving
//
//  Created by bryantcharyn on 16/3/8.
//  Copyright © 2016年 linkloving. All rights reserved.
//

#import "HCL_LeftMenuViewController.h"

@interface HCL_LeftMenuViewController ()

@end

@implementation HCL_LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [btn setBackgroundColor:[UIColor greenColor]];
    [btn addTarget:self action:@selector(dddd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.center = self.view.center;

}
-(void)dddd
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(instancetype)initWithWidthScale:(CGFloat)scale
{
    if (self = [super init]) {
        self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width * scale, [UIScreen mainScreen].bounds.size.height);
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
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
