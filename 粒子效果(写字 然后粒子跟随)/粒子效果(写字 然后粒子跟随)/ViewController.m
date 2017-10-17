//
//  ViewController.m
//  粒子效果(写字 然后粒子跟随)
//
//  Created by 万艳勇 on 2017/10/17.
//  Copyright © 2017年 SKOrganization. All rights reserved.
//

#import "ViewController.h"
#import "VCView.h"
@interface ViewController ()

@property (strong, nonatomic) IBOutlet VCView *vcView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
// 重绘
- (IBAction)reStart:(id)sender {
    [self.vcView redraw];
}

// 开始
- (IBAction)start:(UIButton *)sender {
    [self.vcView start];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
