//
//  HCL_ContainerViewController.h
//  Linkloving
//
//  Created by bryantcharyn on 16/3/9.
//  Copyright © 2016年 linkloving. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCL_LeftMenuViewController.h"
@interface HCL_ContainerViewController : UIViewController

@property (strong,nonatomic)HCL_LeftMenuViewController *leftVC;
@property (strong,nonatomic)UIViewController *mainVC;


-(instancetype)initWithMainVC:(UIViewController *)mainVC LeftVC:(HCL_LeftMenuViewController *)leftVC;


-(void)showOrHideMainVC;
@end
