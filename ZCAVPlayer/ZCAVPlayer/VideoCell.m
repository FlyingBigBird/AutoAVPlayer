//
//  VideoCell.m
//  ZCAVPlayer
//
//  Created by BaoBaoDaRen on 2018/12/24.
//  Copyright © 2018年 BaoBao. All rights reserved.
//

#import "VideoCell.h"
#import "ZCMediaPlayer.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setVideoCellSubs];
    }
    return self;
}

- (void)setVideoCellSubs
{
    self.numLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240)];
    self.numLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.numLab];

    self.mediaPlayer = [[ZCMediaPlayer alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240)];
//    NSString *path = @"http://img.ksbbs.com/asset/Mon_1703/d30e02a5626c066.mp4";
//    _player.videoURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",path]];
    [self.contentView addSubview:self.mediaPlayer];
    self.mediaPlayer.hidden = YES; 
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
