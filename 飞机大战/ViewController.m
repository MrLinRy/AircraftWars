//
//  ViewController.m
//  飞机大战
//
//  Created by Mr.Lin on 2017/4/23.
//  Copyright © 2017年 Mr.LinRy. All rights reserved.
//

#import "ViewController.h"
#import "PlayView.h"//导入作战页面
@interface ViewController ()

@end


@implementation ViewController
//void返回值的意思，函数名

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    //创建开始按钮
    //cgrect（按钮位置大小（左边距，上边距，宽，高））
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-150, 100, 300, 50)];
    [btn setTitle:@"开始游戏" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)click
{
    //初始化作战页面
    PlayView *play = [[PlayView alloc]init];
    //跳转到作战页面
    [self presentViewController:play animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
