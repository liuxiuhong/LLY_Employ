//
//  ArticleList.h
//  zhiliang_text
//
//  Created by Ibokan on 13-2-20.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleList : NSObject
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *ID;
@property(nonatomic,retain)NSMutableArray *articles;
+(ArticleList *)articleListwithDic:(NSDictionary *)dic;
@end
