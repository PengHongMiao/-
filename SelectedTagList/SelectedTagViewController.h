//
//  SelectedTagView.h
//  SelectedTagList
//
//  Created by FreshManCode on 16/8/30.
//  Copyright © 2016年 dass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedTagViewController : UIViewController
@property (nonatomic,strong) NSArray *lastSelected;
@property (nonatomic,copy) void (^DidSelectedTags) (NSArray *tagArray);

@end
