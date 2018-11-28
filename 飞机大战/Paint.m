//
//  Paint.m
//  iOS飞机大战_4.22
//
//  Created by Mr.Lin on 2017/4/23.
//  Copyright © 2017年 Mr.LinRy. All rights reserved.
//

#import "Paint.h"
#import "Bullet.h"

@implementation Paint

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //设置背景图
        UIImage *image = [UIImage imageNamed:@"plane_bg"];
        self.backgroundColor = [UIColor colorWithPatternImage:image];
        
        //积分
        self.score = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 150, 50)];
        self.score.textColor = [UIColor blackColor];//颜色
        self.score.font = [UIFont systemFontOfSize:25];
        self.score.text = @"0";
        [self addSubview:self.score];//添加当前视图
        
        
        //把图片@出来
        enemy = [UIImage imageNamed:@"enemy_plane"];
        bullet = [UIImage imageNamed:@"bullet_one"];
        bullet2 = [UIImage imageNamed:@"bullet_3"];
        bullet3 = [UIImage imageNamed:@"bullet_1"];
        bullet4 = [UIImage imageNamed:@"bullet_5"];
        bullet5 = [UIImage imageNamed:@"bullet_6"];
        myPlane = [UIImage imageNamed:@"my_plane"];
        boom = [UIImage imageNamed:@"fire"];
        
        
        //构建存储子弹的集合
        self.allBullet = [NSMutableArray arrayWithCapacity:1000];
        //构建存储敌机的集合
        self.allEnemy = [NSMutableArray arrayWithCapacity:1000];
        //构建爆炸效果的集合数组
        self.allBoom = [NSMutableArray arrayWithCapacity:1000];
         //构建我的飞机的集合数组
        self.allPlane = [NSMutableArray arrayWithCapacity:1000];
        
        //初始化第一架飞机
        firstPlane = 1;
        
        
        bulletStyle = 1;
    }
    return self;
}

//画笔
-(void)drawRect:(CGRect)rect
{
    //设置子弹样式 1 2 3 4 5
    bulletStyle = [self.score.text intValue]/500;
    if (bulletStyle >= 5)
    {
        bulletStyle =5;
    }
    else if (bulletStyle == 0)
    {
        bulletStyle = 1;
    }
    
    
    
    //如果是第一次进入页面
    if (firstPlane == 1)
    {
        firstPlane = 2;
        //指定第一架飞机的坐标
        
        //初始化
        Bullet *b = [[Bullet alloc]init];
        b.x = 100;
        b.y = 500;
        b.isUsed = YES;
        //将第一架飞机的坐标放进存储所有飞机的数组里边儿
        [self.allPlane addObject:b];
    }
    
    //将飞机展示出来
    for (Bullet *b in self.allPlane)
    {
        //将飞机画出来
        [myPlane drawAtPoint:CGPointMake(b.x, b.y)];
        
    }
    
    //将无效的子弹从数组里面删除
    NSMutableArray *removeBullet = [NSMutableArray array];
    //将子弹展示出来
    for (Bullet *b in self.allBullet)
    {
        //如果子弹有效
        if (b.isUsed == YES)
        {
            //子弹样式1
            if(bulletStyle == 1)
            {
                [bullet drawAtPoint:CGPointMake(b.x, b.y)];
            }
            else if(bulletStyle == 2)
            {
                [bullet2 drawAtPoint:CGPointMake(b.x, b.y)];
            }
            else if(bulletStyle == 3)
            {
                [bullet3 drawAtPoint:CGPointMake(b.x-10, b.y)];
            }
            else if(bulletStyle == 4)
            {
                [bullet4 drawAtPoint:CGPointMake(b.x-10, b.y)];
            }
            else if(bulletStyle == 5)
            {
                [bullet5 drawAtPoint:CGPointMake(b.x, b.y)];
            }
        }
        else
        {
            //将无效的子弹添加进数组
            [removeBullet addObject:b];
        }
    }
    //将无效的子弹删除
    [self.allBullet removeObjectsInArray:removeBullet];
    
    
    //将无效的敌机从数组里面删除
    NSMutableArray *removeEnemy = [NSMutableArray array];
    //遍历敌机
    for (Bullet *b in self.allEnemy)
    {
        //如果敌机有效
        if (b.isUsed == YES)
        {
            [enemy drawAtPoint:CGPointMake(b.x, b.y)];
        }
        else
        {
            [removeEnemy addObject:b];
        }
    }
    //将无效的敌机从我的敌机数组里面删除
    [self.allEnemy removeObjectsInArray:removeEnemy];
    
    //画出我的爆炸效果
    //存储需要删除的爆炸
    NSMutableArray *removeBoom = [NSMutableArray array];
    for (Bullet *b in self.allBoom)
    {
        [boom drawAtPoint:CGPointMake(b.x, b.y)];
        if (b.isUsed == NO)
        {
            //将无效的爆炸效果存储起来
            [removeBoom addObject:b];
        }
    }
    //将无效的爆炸从所有的爆炸数组里面删除
    [self.allBoom removeObjectsInArray:removeBoom];
    
}





@end
