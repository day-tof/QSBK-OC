//
//  QiushiContentModel.h
//  Qiushibaike
//
//  Created by 王龙龙 on 15/5/13.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QiushiItem.h"

@interface QiushiContentModel : NSObject

@property (nonatomic, retain) QiushiItem *item;//糗事数据模型
@property (nonatomic, readonly) CGRect contentRect;//内容的坐标大小
@property (nonatomic, readonly) CGFloat pDateOriginY;//发布日期的Y轴坐标
@property (nonatomic, readonly) CGFloat controlPadOriginY;//控制面板的y轴坐标
@property (nonatomic, readonly) CGFloat rowHeight;//最终的行高


+ (id)contentWithDictionary:(NSDictionary *)dict;


@end
