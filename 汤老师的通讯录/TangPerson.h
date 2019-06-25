//
//  TangPerson.h
//  汤老师的通讯录
//
//  Created by student on 2019/6/25.
//  Copyright © 2019 student. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//要实现保存必须继承NSCoding协议
@interface TangPerson : NSObject<NSCoding>
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *tel;
@end

NS_ASSUME_NONNULL_END
