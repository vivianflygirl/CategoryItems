//
//  UIView+StatusView.h
//  智能007
//
//  Created by 7爷 on 16/12/27.
//  Copyright © 2016年 jun. All rights reserved.
//  展示各种状态视图, PS:加载失败，无数据，网络失败....

#import <UIKit/UIKit.h>

@interface UIView (StatusView)

/**
 *  展示一个提示页面
 *
 *  @param tipsContent 提示内容
 */
-(NSInteger)showStatusViewByContent:(NSString *)content;

/**
 *  展示一个加载失败提示页面
 *
 *  @param tipsContent 提示内容 <默认为加载失败，点击重试>
 */
-(NSInteger)showFailStatusViewByContent:(NSString *)content handle:(void(^)(NSInteger viewTag))handle;

-(void)hiddenStatusView;

-(void)hiddenStatusViewByTag:(NSInteger)tag;

@end
