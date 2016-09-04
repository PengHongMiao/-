//
//  ViewController.m
//  SelectedTagList
//
//  Created by FreshManCode on 16/8/30.
//  Copyright © 2016年 dass. All rights reserved.
//

#import "ViewController.h"
#import "SelectedTagViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSArray *tagArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试选择标签";
    UIButton *selectedBtn = [[UIButton alloc]initWithFrame:CGRectMake((kScreen_Width-80)/2.0, kScreen_Height/2.0-15, 80, 30)];
    [selectedBtn setTitle:@"点我选择标签" forState:UIControlStateNormal];
    [selectedBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    selectedBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [selectedBtn addTarget:self action:@selector(selectTagsEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectedBtn];
    
}

- (void)selectTagsEvent:(UIButton *)sender {
    __weak typeof (self) weakSelf = self;
    SelectedTagViewController *selectedVC = [[SelectedTagViewController alloc]init];
    selectedVC.DidSelectedTags = ^ (NSArray *array){
        weakSelf.tagArray = [NSArray arrayWithArray:array];
        NSLog(@"当前选择的标签id为:%@",weakSelf.tagArray);
    };
    selectedVC.lastSelected = self.tagArray;
    [self.navigationController pushViewController:selectedVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end















