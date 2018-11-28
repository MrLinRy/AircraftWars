//
//  Paint.h
//  iOS飞机大战_4.22
//
//  Created by Mr.Lin on 2017/4/23.
//  Copyright © 2017年 Mr.LinRy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Paint : UIView
{
    UIImage *bullet;//子弹
    UIImage *bullet2;//子弹2
    UIImage *bullet3;//子弹3
    UIImage *bullet4;//子弹4
    UIImage *bullet5;//子弹5
    UIImage *enemy;//敌机
    UIImage *myPlane;
    UIImage *boom;//爆炸效果
    
    int firstPlane;//标志位，标志首次进入页面
    int bulletStyle;//子弹样式
}
@property(nonatomic,strong)NSMutableArray *allEnemy;
@property(nonatomic,strong)NSMutableArray *allBullet;
@property(nonatomic,strong)NSMutableArray *allPlane;
@property(nonatomic,strong)NSMutableArray *allBoom;
@property(nonatomic,strong)UILabel *score;
@end
