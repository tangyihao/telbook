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

- (void)show{

    if (self.persons.count==0) {
        printf("对不起，目前还没有联系人！\n");
    }else{
        printf("编号\t 姓名\t 电话\n");
        int c = 0;
        for (TangPerson *p in self.persons) {
            printf("%d\t%s\t%s\n",++c,[p.name UTF8String],[p.tel UTF8String]);
        }
    }
    printf("显示所有的联系人！\n");
}

- (BOOL)delete{
    //得到你想删除的联系人
    printf("请输入你想删除的联系人的编号：");
    char ch[4];
    scanf("%s",ch);
    ch[3]='\0';
    int n = atoi(ch); // atoi() 字符型数组转换为int类型
    //输入数据的校验
    if (n>self.persons.count) {
        printf("无法删除的编号!\n");
        return NO;
    }
    [self.persons removeObjectAtIndex:n-1];
    //同步到磁盘
    [NSKeyedArchiver archiveRootObject:self.persons toFile:@"persons.data"];
    return YES;
}

- (BOOL)update{
    //得到想要修改的联系人
    printf("请输入你想修改的联系人的编号：");
    char ch[4];
    scanf("%s",ch);
    ch[3]='\0';
    int n = atoi(ch);
    if (n<=0 || n>self.persons.count) {
        printf("无法删除的编号!\n");
        return NO;
    }
    char chh[20];
    printf("请输入这个人的姓名:");
    scanf("%s",chh);
    ch[19]='\0';
    TangPerson *person = [[TangPerson alloc]init];
    person.name=[NSString stringWithUTF8String:chh];
    printf("请输入这个人的电话号码:");
    scanf("%s",chh);
    ch[19]='\0';
    person.tel=[NSString stringWithUTF8String:chh];
    self.persons[n-1]=person;
    //同步到磁盘
    [NSKeyedArchiver archiveRootObject:self.persons toFile:@"persons.data"];
    return YES;
}

- (BOOL)find{
    //先得到你想查找的内容
    printf("请输入你想查找的姓名和电话：");
    char ch[20];
    scanf("%s",ch);
    ch[19] = '\0';
    NSString *str = [NSString stringWithUTF8String:ch];
    //到内存中查找
    BOOL bz=NO;
    for (TangPerson *p in self.persons) {
        printf("%s\t%s\t\n",[p.name UTF8String],[p.tel UTF8String]);
        bz = YES;
    }
    return bz;
}
@end
