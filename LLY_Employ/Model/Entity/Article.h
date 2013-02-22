//
//  Article.h
//  zhiliang_text
//
//  Created by Ibokan on 13-2-20.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject


@property(nonatomic,retain)NSString *author;
@property(nonatomic,retain)NSString *content;
@property(nonatomic,retain)NSString *ID;
@property(nonatomic,retain)NSString *startdate;
@property(nonatomic,retain)NSString *subtitle;
@property(nonatomic,retain)NSString *title;

+(Article *)articleWithDic:(NSDictionary*)dic;

@end
