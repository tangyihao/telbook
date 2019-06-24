//
//  TangMenu.h
//  汤老师的通讯录
//
//  Created by student on 2019/6/24.
//  Copyright © 2019 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TangTelbook.h"
NS_ASSUME_NONNULL_BEGIN

@interface TangMenu : NSObject
@property (strong,nonatomic) NSArray *items;
@property (strong,nonatomic) TangTelbook *book;
//通讯录
-(void)show; //显示菜单
-(BOOL)input;  //根据输入值

@end

NS_ASSUME_NONNULL_END
