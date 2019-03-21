//
//  ViewController.m
//  ZCAVPlayer
//
//  Created by BaoBaoDaRen on 2018/12/21.
//  Copyright © 2018年 BaoBao. All rights reserved.
//

#import "ViewController.h"
#import "ZCBasicView.h"
#import "MainVideoTextCell.h"
#import "MoviePlayerViewController.h"
#import "ZCMediaPlayer.h"
#import "VideoCell.h"

#define RowHeight 240.f
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    NSInteger currentRowNum;
}
@property (nonatomic, strong) ZCBasicView *bacicV;
@property (nonatomic, strong) ZCMediaPlayer *mediaPlayer;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    currentRowNum = 0;

    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    /*
    //单击
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapsAction)];
    [tapGesture setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:tapGesture];
    */
    
    self.bacicV = [[ZCBasicView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.bacicV.ZCTable.dataSource = self;
    self.bacicV.ZCTable.delegate = self;
    
    [self.view addSubview:self.bacicV];
    
}
/*
- (void)TapsAction
{
    MoviePlayerViewController * moviePlayerVC = [[MoviePlayerViewController alloc] init];
    NSString *path = @"http://img.ksbbs.com/asset/Mon_1703/d30e02a5626c066.mp4";
    moviePlayerVC.videoPath = path;
    
    [[NSUserDefaults standardUserDefaults] setObject:@"AllPortart" forKey:@"AppOrientation"];
    [self presentViewController:moviePlayerVC animated:YES completion:nil];

    NSTimer *timerLoop = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(timerLoopBeginAction:) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:timerLoop forMode:NSRunLoopCommonModes];
}
- (void)timerLoopBeginAction:(NSTimer *)timer
{
    NSLog(@"嘁哈哈哈哈");
    [timer invalidate];
    timer = nil;
}
*/

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * reUseString = @"cellId";
    VideoCell * cell = [tableView dequeueReusableCellWithIdentifier:reUseString];
    if (cell == nil)
    {
        cell = [[VideoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reUseString];
    }
    
    NSArray *bgArr = @[[UIColor redColor],[UIColor blueColor],[UIColor greenColor]];
    UIColor *getColor = (UIColor *)bgArr[indexPath.row % bgArr.count];
    cell.backgroundColor = getColor;

    cell.numLab.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return RowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) return 0;
    else return 10;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.mediaPlayer.player pause];
    [self playerAutoScroll];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self playerAutoScroll];
    [self playerAutoPlay];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self playerAutoScroll];
    [self playerAutoPlay];
}

- (void)playerAutoScroll
{
    CGFloat offsetY = self.bacicV.ZCTable.contentOffset.y;
    CGFloat remainder = (NSInteger)offsetY % (NSInteger)RowHeight;
    NSInteger rowNum = (NSInteger)offsetY / (NSInteger)RowHeight;
    
    currentRowNum = ((remainder > 0) ? rowNum + 1 : rowNum);
    
    // 获取可播放的行数...
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:currentRowNum inSection:0];
    VideoCell *cell = [self.bacicV.ZCTable cellForRowAtIndexPath:indexPath];

    CGRect originFrame = [self.bacicV convertRect:cell.mediaPlayer.frame fromView:cell];
    CGFloat x = originFrame.origin.x;
    CGFloat y = originFrame.origin.y;
    CGFloat w = originFrame.size.width;
    CGFloat h = originFrame.size.height;
    NSLog(@" X:%f   Y:%f   W:%f    H:%f",x,y,w,h);
    self.mediaPlayer.frame = CGRectMake(0, y, SCREEN_WIDTH, RowHeight);
}
- (void)playerAutoPlay
{
    [self.mediaPlayer.player play];
    NSString *path = @"http://img.ksbbs.com/asset/Mon_1703/d30e02a5626c066.mp4";
    self.mediaPlayer.videoURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",path]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ZCMediaPlayer *)mediaPlayer
{
    if (!_mediaPlayer) {
      
        _mediaPlayer = [[ZCMediaPlayer alloc]init];
        [self.view addSubview:_mediaPlayer];
    }
    
    return _mediaPlayer;
}
- (void)screenChange
{
    if (currentRowNum) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:currentRowNum inSection:0];
        [self.bacicV.ZCTable scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }
}

@end
