//
//  TangPerson.m
//  汤老师的通讯录
//
//  Created by student on 2019/6/25.
//  Copyright © 2019 student. All rights reserved.
//

#import "TangPerson.h"

@implementation TangPerson
@synthesize name,tel;

//编码
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:name forKey:@"NAME"];
    [aCoder encodeObject:tel forKey:@"TEL"];
}

//解码
- (instancetype)initWithCoder:(NSCoder *)aDeoder
{
    self = [super init];
    if (self) {
        self.name = [aDeoder decodeObjectForKey:@"NAME"];
        self.tel = [aDeoder decodeObjectForKey:@"TEL"];
    }
    return self;
}
@end
