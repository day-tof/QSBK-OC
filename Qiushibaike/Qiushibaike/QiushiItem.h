//
//  QiushiItem.h
//  Qiushibaike
//
//  Created by 王龙龙 on 15/5/13.


#import <Foundation/Foundation.h>
#import "User.h"

@interface QiushiItem : NSObject

@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSString *published_at;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSNumber *comments_count;

+ (id)itemWithDictionary:(NSDictionary *)dict;

@end
