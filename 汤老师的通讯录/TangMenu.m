//
//  TangMenu.m
//  汤老师的通讯录
//

#import "TangMenu.h"

@implementation TangMenu
@synthesize items;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items=[NSArray arrayWithObjects:@"添加一个联系人",@"删除一个联系人",@"修改一个联系人",@"查找联系人",@"显示所有联系人",@"退出系统", nil];
    }
    return self;
}

- (void)show{
    int c=0;
    for(NSString *str in items){
        c++;
        printf("%d、 %s\n",c,[str UTF8String]);
    }
}

- (BOOL)input{
    char ch[2];
    printf("请选择：(1-6):");
    scanf("%s",ch); //输入字符
    ch[1]='\0'; // 如果超过1个字符，就把后面的直接截断掉
    if(strcmp(ch,"1")==0){
        printf("联系人添加成功！ \n");
    }else if(strcmp(ch,"2")==0){
        printf("联系人删除成功！ \n");
    }else if(strcmp(ch,"3")==0){
        printf("联系人修改成功！ \n");
    }else if(strcmp(ch,"4")==0){
        printf("联系人查找成功！ \n");
    }else if(strcmp(ch,"5")==0){
        printf("显示所有联系人！ \n");
    }else if(strcmp(ch,"6")==0){
        printf("退出系统 \n");
        return YES;
    }else{
        printf("非法的选择！ \n");
    }
    return NO;
}


@end
