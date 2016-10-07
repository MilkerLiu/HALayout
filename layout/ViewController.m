//
//  ViewController.m
//  layout
//
//  Created by dongjianbo on 16/10/7.
//  Copyright © 2016年 aimdev. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Layout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 根布局容器，采用线性布局方式
    //  采用block的目的是让代码有缩进，方便区分布局层级
    //      block中的container = [LinearLayout layout]
    //      block中的layout = rootView
    UIView* rootView = [UIView build:self.view container:[LinearLayout layout] config:^(LinearLayout* container, MarginLayoutParams* params, UIView* layout) {
        // 设置容器方向
        container.orientation = VERTICAL;
        
        // 设置容器宽高
        params.width = MATCH_PARENT;
        params.height = WRAP_CONTENT;
        
        // 设置容器边距
        params.leftMargin = 10.0f;
        params.topMargin = 10.0f;
        params.rightMargin = 10.0f;
        params.bottomMargin = 10.0f;
        
        // 设置容器壁宽
        container.paddingLeft = 5.0f;
        container.paddingTop = 5.0f;
        container.paddingRight = 5.0f;
        container.paddingBottom = 5.0f;
        
        [layout setBackgroundColor:[UIColor greenColor]];
        
        // 这里是LinearLayoutParams类型的布局参数，原因是frameLayout的父容器是LinearLayout(参考Android的布局方式)
        UIView* frameLayout = [UIView build:layout container:[FrameLayout layout] config:^(FrameLayout* container, LinearLayoutParams* params, UIView* layout) {
            params.width = MATCH_PARENT;
            params.height = 100.f;
            
            // 设置容器边距
            params.leftMargin = 10.0f;
            params.topMargin = 10.0f;
            params.rightMargin = 10.0f;
            params.bottomMargin = 10.0f;
            
            [layout setBackgroundColor:[UIColor yellowColor]];
            
            // 这里是FrameLayoutParams类型的布局参数，原因是button的父容器是FrameLayout
            UIButton* button = [UIButton build:layout config:^(FrameLayoutParams* params, UIButton* layout) {
                params.width = 100.0f;
                params.height = 50.0f;
                
                params.leftMargin = 20.0f;
                params.topMargin = 20.0f;
                
                [layout setBackgroundColor:[UIColor greenColor]];
                [layout setTitle:@"按钮" forState:UIControlStateNormal];
            }];
        }];
        
        UIView* relativeLayout = [UIView build:layout container:[RelativeLayout layout] config:^(RelativeLayout* container, LinearLayoutParams* params, UIView* layout) {
            // 设置容器宽高
            params.width = MATCH_PARENT;
            params.height = WRAP_CONTENT;
            
            // 设置容器边距
            params.leftMargin = 10.0f;
            params.topMargin = 10.0f;
            params.rightMargin = 10.0f;
            params.bottomMargin = 10.0f;
            
            // 设置容器壁宽
            container.paddingLeft = 5.0f;
            container.paddingTop = 5.0f;
            container.paddingRight = 5.0f;
            container.paddingBottom = 5.0f;
            
            [layout setBackgroundColor:[UIColor yellowColor]];
            
            UIButton* button = [UIButton build:layout config:^(RelativeLayoutParams* params, UIButton* layout) {
                params.width = 100.0f;
                params.height = 50.0f;
                
                params.leftMargin = 20.0f;
                params.topMargin = 20.0f;
                
                [layout setBackgroundColor:[UIColor greenColor]];
                [layout setTitle:@"按钮" forState:UIControlStateNormal];
            }];
            
            UILabel* label1 = [UILabel build:layout config:^(RelativeLayoutParams* params, UILabel* layout) {
                params.width = WRAP_CONTENT;
                params.height = WRAP_CONTENT;
                
                // 与button上对齐
                params.alignTop = button;
                
                // 在button的右边
                params.rightOf = button;
                
                // 距button 20 dp
                params.leftMargin = 20.0f;
                
                
                [layout setText:@"label1"];
            }];
            
            UILabel* label2 = [UILabel build:layout config:^(RelativeLayoutParams* params, UILabel* layout) {
                params.width = WRAP_CONTENT;
                params.height = WRAP_CONTENT;
                
                // 在父容器的右侧
                params.alignParentRight = YES;
                
                // 距父容器的右侧20dp
                params.rightMargin = 20.0f;
                
                // 与button上对齐
                params.alignTop = button;
                
                [layout setText:@"label2"];
            }];
            
            UIImageView* image = [UIImageView build:layout config:^(RelativeLayoutParams* params, UIImageView* layout) {
                params.width = WRAP_CONTENT;
                params.height = WRAP_CONTENT;
                
                // 在button的下面
                params.belowOf = button;
                
                // 距button 20 dp
                params.leftMargin = 20.0f;
                
                // 距button上侧距离20dp
                params.topMargin = 20.0f;
                
                [layout setImage:[UIImage imageNamed:@"icon.png"]];
            }];
            
            UIImageView* centerImage = [UIImageView build:layout config:^(RelativeLayoutParams* params, UIImageView* layout) {
                params.width = WRAP_CONTENT;
                params.height = WRAP_CONTENT;
                
                // 在父容器的中间位置
                params.centerVertical = YES;
                params.centerHorizontal = YES;
                
                [layout setImage:[UIImage imageNamed:@"icon.png"]];
            }];
            
        }];
    }];
    
    [rootView requestLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
