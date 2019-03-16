//
//  YNPageScrollMenuView.h
//  YNPageViewController
//
//  Created by ZYN on 2018/4/22.
//  Copyright © 2018年 yongneng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YNPageConfigration;

@protocol YNPageScrollMenuViewDelegate <NSObject>
@optional
/// 点击item
- (void)pagescrollMenuViewItemOnClick:(UIButton *)button index:(NSInteger)index;

/// 点击Add按钮
- (void)pagescrollMenuViewAddButtonAction:(UIButton *)button;

@end

@interface YNPageScrollMenuView : UIView
/// 添加按钮
@property (nonatomic, strong) UIButton *addButton;

/// 标题数组
@property (nonatomic, strong) NSMutableArray *titles;

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

/**
 初始化YNPageScrollMenuView
 
 @param frame 大小
 @param titles 标题
 @param configration 配置信息
 @param delegate 代理
 @param currentIndex 当前选中下标
 */
+ (instancetype)pagescrollMenuViewWithFrame:(CGRect)frame
                                     titles:(NSMutableArray *)titles
                               configration:(YNPageConfigration *)configration
                                   delegate:(id<YNPageScrollMenuViewDelegate>)delegate
                               currentIndex:(NSInteger)currentIndex;

/// 根据 下标 修改 对应标题
- (void)updateTitle:(NSString *)title index:(NSInteger)index;

/// 根据标题数组刷新标题
- (void)updateTitles:(NSArray *)titles;

/// 根据下标调整Item位置
- (void)adjustItemPositionWithCurrentIndex:(NSInteger)index;

/// 根据上个下标和当前点击的下标调整进度  (没啥实际用处)
- (void)adjustItemWithProgress:(CGFloat)progress
                     lastIndex:(NSInteger)lastIndex
                  currentIndex:(NSInteger)currentIndex;
/// 选中下标
- (void)selectedItemIndex:(NSInteger)index
                 animated:(BOOL)animated;
/// 调整Item
- (void)adjustItemWithAnimated:(BOOL)animated;

/// 调整Item
- (void)adjustItemAnimate:(BOOL)animated;

/// 刷新视图 (会清空全部的item,重新创建布局)
- (void)reloadView;

@end

