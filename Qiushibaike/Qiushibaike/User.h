//
//  User.h
//  Qiushibaike
//
//  Created by 王龙龙 on 15/5/13.


#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, retain) NSString *login;//用户名称
@property (nonatomic, retain) NSString *icon;//用户头像


+ (id)userWithDictionary:(NSDictionary *)dict;//根据接口返回的数据为user对象赋值


@end
