//
//  TagView.m
//  SelectedTagList
//
//  Created by FreshManCode on 16/8/30.
//  Copyright © 2016年 dass. All rights reserved.
//

#import "TagView.h"


@interface TagView ()
@property (nonatomic,strong) NSMutableArray *slectedArray;
@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation TagView
- (id)initWithTitle:(NSString *)title contentTitleArray:(NSArray *)contentArray frame:(CGRect)frame delegate:(id)delegate {
    if (self = [super initWithFrame:frame]) {
        _slectedArray = [[NSMutableArray alloc]initWithCapacity:0];
        _delegate     = delegate;
        [self setUpSubViewsWithTitle:title tagArray:contentArray selectedTagArray:nil];
    }
    return self;
}


- (id)initWithTitle:(NSString *)title tagArray:(NSArray *)tagArray selectedTagArray:(NSArray *)selectedArray frame:(CGRect)frame delegate:(id)delagte {
    if (self = [super initWithFrame:frame]) {
        _slectedArray = [[NSMutableArray alloc]initWithCapacity:0];
        _delegate     = delagte;
        [self setUpSubViewsWithTitle:title tagArray:tagArray selectedTagArray:selectedArray];
    }
    return self;
}

- (void)setUpSubViewsWithTitle:(NSString *)title tagArray:(NSArray *)array selectedTagArray:(NSArray *)selectedArray {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 50, 15)];
        _titleLabel.text = title;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:13.0f];
    }
    [self addSubview:_titleLabel];
    
    NSInteger itemBtnWidth = (kScreen_Width - 5*kItemsBetweenWidth)/4;   //标签宽度
    NSInteger itemBtnHeight = 28;     //标签高度
    for (int i= 0;i<array.count;i++) {
        CGFloat x = (kItemsBetweenWidth +itemBtnWidth)  * (i%4) + kItemsBetweenWidth;
        CGFloat y = (kItemsBetweenWidth +itemBtnHeight) * (i/4) + kItemsBetweenWidth + CGRectGetMaxY(_titleLabel.frame);
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, itemBtnWidth, itemBtnHeight)];
        if ([array[i] isKindOfClass:[NSDictionary class]]) {
            if ([self.tagTitle length] > 0) {
                NSDictionary *tempDic = array[i];
                [btn setTitle:tempDic[self.tagTitle] forState:UIControlStateNormal];
            } else {
                NSLog(@"如果使用的是Dictionary,请传入 key ");
            }
        } else {
            [btn setTitle:array[i] forState:UIControlStateNormal];
        }
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(itemBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.layer.cornerRadius  = 4;
        btn.layer.masksToBounds = YES;
        btn.tag = 10 +i;
        [self addSubview:btn];
    }
    if (selectedArray.count >0) {
        _slectedArray = [[NSMutableArray alloc]initWithArray:selectedArray];
        for (NSString *selectedTag in selectedArray) {
            UIButton *btn = [self viewWithTag:[selectedTag integerValue]];
            if (btn) {
                btn.selected = YES;
                btn.layer.borderWidth = 1.0f;
                btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
            }
        }
    }
}

- (void)itemBtnClicked:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        sender.layer.borderWidth = 0.0f;
        NSString *tagString = [NSString stringWithFormat:@"%d",(int)sender.tag];
        if ([_slectedArray containsObject:tagString]) {
            [_slectedArray removeObject:tagString];
        }
    } else {
        sender.selected = YES;
        sender.layer.borderWidth = 1.0f;
        sender.layer.borderColor = [UIColor lightGrayColor].CGColor;
        NSString *tagString = [NSString stringWithFormat:@"%d",(int)sender.tag];
        if (![_slectedArray containsObject:tagString]) {
            [_slectedArray addObject:tagString];
        }
    }
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectedTagArray:)]) {
        [_delegate didSelectedTagArray:_slectedArray.count >0 ? _slectedArray :@[]];
    }
    
}







@end












