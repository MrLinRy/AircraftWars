//
//  PlayView.m
//  iOS飞机大战_4.22
//
//  Created by Mr.Lin on 2017/4/23.
//  Copyright © 2017年 Mr.LinRy. All rights reserved.
//

#import "PlayView.h"
#import "Bullet.h"
@interface PlayView ()

@end

@implementation PlayView

- (void)viewDidLoad {
    [super viewDidLoad];
    paint = [[Paint alloc]init];
    //指定我的页面为画图页面
    self.view = paint;
    
        
    
    //创建定时器
    time1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(move) userInfo:nil repeats:YES];
    time2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(enemy) userInfo:nil repeats:YES];
    
    //初始化敌机数量
    enemyNumber = 0;
}

//第一个定时器
-(void)move
{
    //移动子弹
    for (Bullet *b in paint.allBullet)
    {
        b.y = b.y-20;
        if (b.y < 20)
        {
            //如果子弹飞出屏幕
            b.isUsed = NO;
        }
    }
    
    //碰撞检测
    for (Bullet *b in paint.allBullet)
    {
        //做一个子弹的矩阵
        CGRect bulletRect = CGRectMake(b.x, b.y, 18, 18);
        //遍历敌机
        for (Bullet *b2 in paint.allEnemy)
        {
            //给敌机一个矩阵
            CGRect enemyRect = CGRectMake(b2.x, b2.y, 50, 50);
            //正经的碰撞
            if (CGRectIntersectsRect(bulletRect, enemyRect) == YES)
            {
                //得到当前的分数
                NSString *currentScore = paint.score.text;
                int score = [currentScore intValue];
                score = score + 50;
                paint.score.text = [NSString stringWithFormat:@"%d",score];
                
                
                b.isUsed = NO;
                b2.isUsed = NO;
                //增加爆炸效果
                Bullet *b3 = [[Bullet alloc]init];
                b3.x = b2.x;
                b3.y = b2.y;
                [paint.allBoom addObject:b3];
            }
        }
    }
    
    //重新绘制屏幕
    [self.view setNeedsDisplay];
}


//第二个定时器
-(void)enemy
{
    enemyNumber++;
    if (enemyNumber % 5 == 0)
    {
        int x = arc4random()%(int)[UIScreen mainScreen].bounds.size.width-30;
        
        //初始化敌机坐标
        Bullet *b = [[Bullet alloc]init];
        b.x = x;
        b.y = 20;
        b.isUsed = YES;
        
        //将敌机将入我的敌机数组里面
        [paint.allEnemy addObject:b];
    }
    
    //做移动
    for (Bullet *b in paint.allEnemy)
    {
        b.y = b.y+15;
        if (b.y > [UIScreen mainScreen].bounds.size.height)
        {
            //如果子弹飞出屏幕
            b.isUsed = NO;
        }
    }
    
}

//点击事件
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //获取所有点击对象
    UITouch *touch = [touches anyObject];
    //获取我们刚刚点击那个坐标
    CGPoint p = [touch locationInView:self.view];
    
    if (p.y > 300)
    {
        //将这个坐标当作当前飞机的坐标
        //第一步：将之前的飞机删除掉
        [paint.allPlane removeAllObjects];
        
        //第二步，添加一架新的飞机
        Bullet *b = [[Bullet alloc]init];
        b.x = p.x-30;
        b.y = p.y-20;
        b.isUsed = YES;
        //第三步，将飞机坐标添加进数组
        [paint.allPlane addObject:b];
        
        //添加子弹
        Bullet *b2 = [[Bullet alloc]init];
        b2.x = p.x-19;
        b2.y = p.y-50;
        b2.isUsed = YES;
        //将子弹坐标添加进数组
        [paint.allBullet addObject:b2];
    }
    //重新画图
    [self.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
