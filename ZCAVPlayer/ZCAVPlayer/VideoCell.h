//
//  VideoCell.h
//  ZCAVPlayer
//
//  Created by BaoBaoDaRen on 2018/12/24.
//  Copyright © 2018年 BaoBao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCMediaPlayer.h"

@interface VideoCell : UITableViewCell

@property (nonatomic, strong) ZCMediaPlayer *mediaPlayer;

@property (nonatomic, strong) UILabel *numLab;

@end
