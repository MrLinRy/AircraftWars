//
//  Bullet.h
//  iOS飞机大战_4.22
//
//  Created by Mr.Lin on 2017/4/23.
//  Copyright © 2017年 Mr.LinRy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bullet : NSObject
//x，y，是否有用

@property(assign,nonatomic) int x;
@property(assign,nonatomic) int y;
@property(assign,nonatomic) BOOL isUsed;


@end
