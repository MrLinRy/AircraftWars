//
//  PlayView.h
//  iOS飞机大战_4.22
//
//  Created by Mr.Lin on 2017/4/23.
//  Copyright © 2017年 Mr.LinRy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Paint.h"
@interface PlayView : UIViewController
{
    Paint *paint;
    NSTimer *time1;
    NSTimer *time2;//定时器
    
    int enemyNumber;//敌机数量
}
@end
