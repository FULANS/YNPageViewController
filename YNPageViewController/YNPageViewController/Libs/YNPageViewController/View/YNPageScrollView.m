//
//  YNPageScrollView.m
//  YNPageViewController
//
//  Created by ZYN on 2018/4/22.
//  Copyright © 2018年 yongneng. All rights reserved.
//

#import "YNPageScrollView.h"
#import "UIView+YNPageExtend.h"
//#import <objc/runtime.h>

@interface YNPageScrollView () <UIGestureRecognizerDelegate>

@end

@implementation YNPageScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    if ([self panBack:gestureRecognizer]) {
        return YES;
    }
    return NO;
}

// 用于判断用户是否是要滑动返回上一个页面
- (BOOL)panBack:(UIGestureRecognizer *)gestureRecognizer {
    int location_X = 0.15 * kYNPAGE_SCREEN_WIDTH; // 侧边返回的临界范围:0.15倍的屏宽
    
    if (gestureRecognizer == self.panGestureRecognizer) { // 平移手势
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        // 手指在视图上移动的位置（x,y）向下和向右为正，向上和向左为负。 （0，0点从你下手的地方开始）
        CGPoint point = [pan translationInView:self];
        UIGestureRecognizerState state = gestureRecognizer.state;
        if (UIGestureRecognizerStateBegan == state || UIGestureRecognizerStatePossible == state) {
            // 手指在视图上的位置（x,y）就是手指在视图(UIScrollview)本身坐标系的位置。
            CGPoint location = [gestureRecognizer locationInView:self];
            int temp1 = location.x; // 由于 视图 是 UIScrollview,存在 contentSize (超过一屏幕的存在)
            int temp2 = kYNPAGE_SCREEN_WIDTH;
            NSInteger XX = temp1 % temp2; // 所以这边 计算 实际 在当前屏幕下的 手指 位置
            if (point.x >0 && XX < location_X) { // 如果 手指 向右 移动 并且 手指实际位置 在 临界范围之内
                return YES;
            }
        }
    }
    return NO;
}

// 是否允许触发手势: 开始进行手势识别时调用的方法，返回NO则结束识别，不再触发手势，用处：可以在控件指定的位置使用手势识别
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self panBack:gestureRecognizer]) { // 如果是返回上一页的操作,直接结束识别
        return NO;
    }
    return YES;
}

@end

