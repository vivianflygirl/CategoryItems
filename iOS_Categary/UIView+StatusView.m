//
//  UIView+StatusView.m
//  智能007
//
//  Created by 7爷 on 16/12/27.
//  Copyright © 2016年 jun. All rights reserved.
//

#import "UIView+StatusView.h"

#define ZN_StatusContentTag 11001
#define ZN_StatusFailTag 11002

@implementation UIView (StatusView)

-(NSInteger)showStatusViewByContent:(NSString *)content
{
    UIView *view = [self viewWithTag:ZN_StatusContentTag];
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        view.userInteractionEnabled = NO;
        view.backgroundColor = hexStringToColor(@"F8F7FC");
        view.tag = ZN_StatusContentTag;
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.centerY - 80, self.width, 80)];
        contentLabel.text = content.length ? content : @"";
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.adjustsFontSizeToFitWidth = YES;
        contentLabel.textColor = hexStringToColor(@"999999");
        contentLabel.font = ZN_NAVIBARFONT;
        [view addSubview:contentLabel];
        
        [self addSubview:view];
        [self bringSubviewToFront:view];
        return view.tag;
    }
    return view.tag;
}

-(NSInteger)showFailStatusViewByContent:(NSString *)content handle:(void(^)(NSInteger viewTag))handle
{
    UIView *view = [self viewWithTag:ZN_StatusFailTag];
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        view.userInteractionEnabled = NO;
        view.backgroundColor = hexStringToColor(@"F8F7FC");
        view.tag = ZN_StatusFailTag;
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.centerY - 80, self.width, 80)];
        contentLabel.text = content.length ? content : @"加载失败，点击重试";
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.adjustsFontSizeToFitWidth = YES;
        contentLabel.textColor = hexStringToColor(@"999999");
        contentLabel.font = ZN_NAVIBARFONT;
        [view addSubview:contentLabel];
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            if (handle) {
                handle(ZN_StatusFailTag);
            }
        }];
        
        [view addGestureRecognizer:tapGes];
        view.userInteractionEnabled = YES;
        
        [self addSubview:view];
        [self bringSubviewToFront:view];
        return view.tag;
    }
    return view.tag;
}

-(void)hiddenStatusView
{
    [self hiddenStatusViewByTag:ZN_StatusContentTag];
}

-(void)hiddenStatusViewByTag:(NSInteger)tag
{
    __block UIView *view = [self viewWithTag:tag];
    if (view) {
        [UIView animateWithDuration:0.3 animations:^{
            view.alpha = 0.0;
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
            view = nil;
        }];
    }
}

@end
