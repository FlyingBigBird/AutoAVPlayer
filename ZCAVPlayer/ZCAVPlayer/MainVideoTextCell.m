//
//  MainVideoTextCell.m
//  qwz
//
//  Created by BaoBaoDaRen on 17/3/17.
//  Copyright © 2017年 康振超. All rights reserved.
//

#import "MainVideoTextCell.h"
#import "UILabel+LabCornerRadius.h"

@implementation MainVideoTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setMainVidelCellSubfolder];
}

- (void)setMainVidelCellSubfolder
{
    self.movieTitLab = [[UILabel alloc] init];
    [self.contentView addSubview:self.movieTitLab];
    
    self.mediaPlayerView = [[UIView alloc] init];
    [self.contentView addSubview:self.mediaPlayerView];
    
    self.mediaImageView = [[UIImageView alloc] init];
    [self.mediaPlayerView addSubview:self.mediaImageView];
    self.mediaImageView.clipsToBounds = YES;
    self.mediaImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.mediaPlayerView addSubview:self.mediaImageView];
    
    self.mediaPlayImageView = [[UIImageView alloc] init];
    [self.mediaPlayerView addSubview:self.mediaPlayImageView];
    self.mediaPlayImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.mediaPlayImageView.clipsToBounds = YES;
    self.mediaPlayImageView.image = [UIImage imageNamed:@"iconPause-2-2"];
    
    self.browseNumLab = [[UILabel alloc] init];
    [self.contentView addSubview:self.browseNumLab];
    self.browseNumLab.textAlignment = NSTextAlignmentLeft;
    [self.browseNumLab resetLabelCornerRadius:0 withTitleColor:[UIColor blackColor] withBgColor:[UIColor clearColor] withTitleFont:14 withNumberLine:0];
    
    self.timeLengthLabel = [[UILabel alloc] init];
    [self.mediaPlayerView addSubview:self.timeLengthLabel];
    [self.timeLengthLabel resetLabelCornerRadius:0 withTitleColor:[UIColor blackColor] withBgColor:[UIColor clearColor] withTitleFont:14 withNumberLine:0];
    self.timeLengthLabel.textAlignment = NSTextAlignmentRight;
}

- (void)setFamousLectureCellWithArray:(NSArray *)array andIndexPath:(NSIndexPath *)indexPath
{
    self.movieTitLab.text = [NSString stringWithFormat:@"%@",[array[indexPath.row] objectForKey:@"title"]];
    NSString * timeLength = [NSString stringWithFormat:@"%@",[array[indexPath.row] objectForKey:@"length"]];
    self.timeLengthLabel.text = @"03:38";

}

- (void)setVideoPath:(NSString *)videoPath
{
    _videoPath = videoPath;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.movieTitLab.frame = CGRectMake(15, 5, self.contentView.frame.size.width - 30, 30);
    [self.movieTitLab resetLabelCornerRadius:0 withTitleColor:[UIColor blackColor] withBgColor:[UIColor clearColor] withTitleFont:14 withNumberLine:0];
    
    self.mediaPlayerView.frame = CGRectMake(15, 5 + 30 + 5, self.contentView.frame.size.width - 30, self.contentView.frame.size.height - 5 - 5 - 30 - 5 - 5 - 20);
    self.mediaPlayerView.backgroundColor = [UIColor lightGrayColor];
    
    self.mediaImageView.frame = self.mediaPlayerView.bounds;
    
    self.mediaPlayImageView.frame = CGRectMake(self.mediaPlayerView.frame.size.width / 2 - 25, self.mediaPlayerView.frame.size.height / 2 - 25, 50, 50);
    
    self.browseNumLab.frame = CGRectMake(15, self.contentView.frame.size.height - 5 - 20, self.contentView.frame.size.width - 30, 20);
    
    self.timeLengthLabel.frame = CGRectMake(15, self.mediaPlayerView.frame.size.height - 10 - 20, self.mediaPlayerView.frame.size.width - 30, 20);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
