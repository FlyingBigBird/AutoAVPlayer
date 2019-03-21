//
//  ZCBasicView.m
//  ZCAVPlayer
//
//  Created by BaoBaoDaRen on 2018/12/21.
//  Copyright © 2018年 BaoBao. All rights reserved.
//

#import "ZCBasicView.h"

@implementation ZCBasicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setZCBasicViewSubs:frame];
    }
    return self;
}

- (void)setZCBasicViewSubs:(CGRect)supframe
{
    self.ZCTable = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    [self addSubview:self.ZCTable];
    self.ZCTable.backgroundColor = [UIColor whiteColor];
    self.ZCTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.1, 0.1)];
    self.ZCTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.1, 0.1)];
    self.ZCTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.ZCTable.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    if (@available(iOS 11.0, *)) {
        self.ZCTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.ZCTable.frame = self.bounds;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
