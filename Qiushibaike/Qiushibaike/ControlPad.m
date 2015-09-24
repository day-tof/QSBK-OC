//
//  ControlPad.m
//  Qiushibaike
//
//  Created by 王龙龙 on 15/5/13.


#import "ControlPad.h"

@interface ControlPad ()


@property (nonatomic, retain) UIButton *faviButton;//喜欢
@property (nonatomic, retain) UIButton *againstButton;//不喜欢
@property (nonatomic, retain) UIButton *commentButton;//评论
@property (nonatomic, retain) UIButton *moreButton;//更多

@end


@implementation ControlPad
-(void)dealloc {
    [_faviButton release];
    [_againstButton release];
    [_commentButton release];
    [_moreButton release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame {
    frame = CGRectMake(0, frame.origin.y, [UIScreen mainScreen].bounds.size.width, 50);
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.faviButton];
        [self addSubview:self.againstButton];
        [self addSubview:self.commentButton];
        [self addSubview:self.moreButton];
    }
    return self;
}

- (UIButton *)faviButton {
    if (!_faviButton) {
        self.faviButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _faviButton.frame = CGRectMake(0, 0, 78, 49);
        [_faviButton setImage:[UIImage imageNamed:@"icon_for"] forState:UIControlStateNormal];
        [_faviButton setImage:[UIImage imageNamed:@"icon_for_active"] forState:UIControlStateHighlighted];
    }
    return _faviButton;
}

- (UIButton *)againstButton {
    if (!_againstButton) {
        self.againstButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _againstButton.frame = CGRectMake(98, 0, 64.5, 49);
        [_againstButton setImage:[UIImage imageNamed:@"icon_against"] forState:UIControlStateNormal];
        [_againstButton  setImage:[UIImage imageNamed:@"icon_againt_active"] forState:UIControlStateHighlighted];
    }
    return _againstButton;
}

-(UIButton *)commentButton {
    if (!_commentButton) {
        self.commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _commentButton.frame = CGRectMake(182.5, 0, 75.5, 49);
        [_commentButton setImage:[UIImage imageNamed:@"button_comment"] forState:UIControlStateNormal];
    }
    return _commentButton;
}

-(UIButton *)moreButton {
    if (!_moreButton) {
        self.moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 61.5, 0, 61.5, 49);
        [_moreButton setImage:[UIImage imageNamed:@"icon_fav"] forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"icon_fav_active"] forState:UIControlStateHighlighted];
    }
    return _moreButton;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
