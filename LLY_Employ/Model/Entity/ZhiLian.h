//
//  ZhiLian.h
//  zhiliang_text
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhiLian : NSObject
@property(nonatomic,retain)NSString *uticket;
@property(nonatomic,retain)NSMutableArray *resumelist;
@property(nonatomic,assign)int no_read;
@property(nonatomic,assign) int apply_count;
@property(nonatomic,assign) int fav_count;
@property(nonatomic,assign) int job_searcher_count;
+(ZhiLian *)getZhilianFromDic:(NSDictionary *)dic;
@end
