//
//  SelectedTagView.m
//  SelectedTagList
//
//  Created by FreshManCode on 16/8/30.
//  Copyright © 2016年 dass. All rights reserved.
//

#import "SelectedTagViewController.h"
#import "TagView.h"
@interface SelectedTagViewController () <TagViewDelegate>
@property (nonatomic,strong) NSArray *dataAray;
@property (nonatomic,strong) TagView *tagView;
@property (nonatomic,strong) NSArray *selectedArray;
@end

@implementation SelectedTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"测试选择标签";
    _dataAray = [[NSArray alloc] initWithObjects:@"沙发家居",@"酒店工程",@"箱包手袋",@"餐椅",@"软包硬包",@"皮鞋",@"服装",@"地毯",@"汽车游艇",@"按摩椅",@"床垫",@"本册",@"眼镜盒",@"礼品盒",@"饰品包装",@"皮带",@"鞍座",@"皮球革",@"商标证件",@"手套",@"帽子",@"其他", nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(finishSelectedTags)];
    [self initTagsView];
}
- (void)initTagsView {
    if (!_tagView) {
        _tagView = [[TagView alloc]initWithTitle:@"标签" tagArray:_dataAray selectedTagArray:self.lastSelected frame:CGRectMake(0, 64, kScreen_Width,kScreen_Width ) delegate:self];
        _tagView.backgroundColor = [UIColor whiteColor];
    }
    [self.view addSubview:_tagView];

}
- (void)didSelectedTagArray:(NSArray *)nameArray {
    self.selectedArray = [NSArray arrayWithArray:nameArray];
}

- (void)finishSelectedTags {
    if (self.DidSelectedTags) {
        self.DidSelectedTags(self.selectedArray);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end



























