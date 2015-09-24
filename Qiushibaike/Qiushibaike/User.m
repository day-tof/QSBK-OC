//
//  User.m
//  Qiushibaike
//
//  Created by 王龙龙 on 15/5/13.


#import "User.h"

#define kUserAvatarFormat @"http://pic.qiushibaike.com/system/avtnew/%@/%@/medium/%@" //第一个是id的前四位，第二个是id，第三个是icon

@implementation User

- (void)dealloc {
    [_icon release];
    [_login release];
    [super dealloc];
}

+(id)userWithDictionary:(NSDictionary *)dict {
    User *anUser = [[User alloc] init];
    anUser.login = dict[@"login"];
    NSString *userID = dict[@"id"];
    NSString *avatarName = dict[@"icon"];

    anUser.icon = [NSString stringWithFormat:kUserAvatarFormat,[userID substringToIndex:4],userID,avatarName];
    return [anUser autorelease];
}

@end
