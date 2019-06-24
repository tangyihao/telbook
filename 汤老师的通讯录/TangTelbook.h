//
//  TangTelbook.h
//  汤老师的通讯录
//
//  Created by student on 2019/6/24.
//  Copyright © 2019 student. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TangTelbook : NSObject
@property (strong,nonatomic) NSMutableArray *persons;
-(BOOL)add;
-(BOOL)delete;
-(BOOL)update;
-(BOOL)find;
-(void)show;
@end

NS_ASSUME_NONNULL_END
