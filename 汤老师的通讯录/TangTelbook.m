//
//  TangTelbook.m
//  汤老师的通讯录
//
//  Created by student on 2019/6/24.
//  Copyright © 2019 student. All rights reserved.
//

#import "TangTelbook.h"
#import "TangPerson.h"
@implementation TangTelbook

- (instancetype)init
{
    self = [super init];
    if (self) {
        //从文件里读取联系人
        self.persons = [NSKeyedUnarchiver unarchiveObjectWithFile:@"persons.data"];
        if (self.persons == nil) {
            //创建集合对象
            self.persons = [NSMutableArray arrayWithCapacity:100];
        }
    }
    return self;
}

- (BOOL)add{
    char ch[20];
    TangPerson *person = [[TangPerson alloc]init];
    printf("请输入联系人的姓名：");
    scanf("%s",ch);
    ch[19]='\0';
    person.name = [NSString stringWithUTF8String:ch];
    printf("请输入联系人的电话：");
    scanf("%s",ch);
    ch[19]='\0';
    person.tel = [NSString stringWithUTF8String:ch];
    //对输入的数据进行校验
    //加入到通讯录
    [self.persons addObject:person];
    //持久化写入到磁盘序列上
    [NSKeyedArchiver archiveRootObject:self.persons toFile:@"persons.data"];
    printf("添加联系人！\n");
    return YES;
    
}
@end
