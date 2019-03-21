//
//  MainVideoTextCell.h
//  qwz
//
//  Created by BaoBaoDaRen on 17/3/17.
//  Copyright © 2017年 康振超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVideoTextCell : UITableViewCell

@property (nonatomic, strong) UILabel       * movieTitLab;

@property (nonatomic, strong) UIView        * mediaPlayerView;

@property (nonatomic, strong) UIImageView   * mediaImageView;

@property (nonatomic, strong) NSString      * mediaUrlString;

@property (nonatomic, strong) UIImageView   * mediaPlayImageView;

@property (nonatomic, strong) UILabel       * timeLengthLabel;;

@property (nonatomic, strong) UILabel       * browseNumLab;

@property (nonatomic, strong) NSString      * videoPath;

- (void)setVideoPath:(NSString *)videoPath;

- (void)setFamousLectureCellWithArray:(NSArray *)array andIndexPath:(NSIndexPath *)indexPath;

@end
