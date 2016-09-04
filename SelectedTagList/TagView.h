//
//  TagView.h
//  SelectedTagList
//
//  Created by FreshManCode on 16/8/30.
//  Copyright © 2016年 dass. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TagView;
@protocol TagViewDelegate <NSObject>

@optional
- (void)didSelectedTagArray:(NSArray *)nameArray;

@end



@interface TagView : UIView
@property (nonatomic,copy)   NSString *tagTitle;
@property (nonatomic,assign) id <TagViewDelegate> delegate;

//不需要记录上次的选择
- (id)initWithTitle:(NSString *)title contentTitleArray:(NSArray *)contentArray frame:(CGRect)frame delegate:(id)delegate;

//可以记录上次的选择
- (id)initWithTitle:(NSString *)title tagArray:(NSArray *)tagArray selectedTagArray:(NSArray *)selectedArray frame:(CGRect)frame delegate:(id)delagte;

@end

















