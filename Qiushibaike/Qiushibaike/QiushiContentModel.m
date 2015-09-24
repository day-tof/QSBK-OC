//
//  QiushiContentModel.m
//  Qiushibaike
//
//  Created by 王龙龙 on 15/5/13.


#import "QiushiContentModel.h"
#define kScreenBounds [[UIScreen mainScreen] bounds]
#define kContentOriginY 65//内容Label的y轴起始点
#define kOffsetY 10//单元格子视图之间的间距

@implementation QiushiContentModel
- (void)dealloc {
    [_item release];
    [super dealloc];
}

+(id)contentWithDictionary:(NSDictionary *)dict {
    QiushiContentModel *contentModel = [[QiushiContentModel alloc] init];
    contentModel.item = [QiushiItem itemWithDictionary:dict];
    return [contentModel autorelease];
}

- (CGRect)contentRect {
    CGRect rect = [self.item.content boundingRectWithSize:CGSizeMake(kScreenBounds.size.width - 20, 2000) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil];
    //修改y轴起始点坐标，并返回
    rect.origin.y = kContentOriginY;
    return rect;

}

- (CGFloat)pDateOriginY {
    return self.contentRect.origin.y + self.contentRect.size.height + kOffsetY;
}

- (CGFloat)controlPadOriginY {
    return self.pDateOriginY + 20 +kOffsetY;
}

- (CGFloat)rowHeight {
    return self.controlPadOriginY + 50 + kOffsetY;
}

@end
