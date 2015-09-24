//
//  QiushiItem.m
//  Qiushibaike
//
//  Created by 王龙龙 on 15/5/13.


#import "QiushiItem.h"

@implementation QiushiItem

-(void)dealloc {
    [_user release];
    [_published_at release];
    [_comments_count release];
    [_content release];
    [super dealloc];
}

+ (id)itemWithDictionary:(NSDictionary *)dict {
    QiushiItem *anItem = [[QiushiItem alloc] init];
    NSDictionary *userDict = dict[@"user"];
    if (![userDict isEqual:[NSNull null]]) {
        anItem.user = [User userWithDictionary:userDict];
    }
    anItem.content = dict[@"content"];
    anItem.comments_count = dict[@"comments_count"];
    anItem.published_at = [anItem _dateWithTimeStamp:dict[@"published_at"]];
    return [anItem autorelease];
}

-(NSString *)_dateWithTimeStamp:(NSNumber  *)stamp {
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    [formatter setDateFormat:@"yyy-MM-dd hh:mm"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:stamp.doubleValue];//得到日期对象
    return [formatter stringFromDate:date];
}


@end
