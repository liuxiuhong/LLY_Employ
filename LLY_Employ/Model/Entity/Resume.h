//
//  Resume.h
//  zhiliang_text
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resume : NSObject
@property(nonatomic,retain)NSString *resume_id;
@property(nonatomic,retain)NSString *resume_number;
@property(nonatomic,retain)NSString *version_number;
@property(nonatomic,retain)NSString *resume_name;
@property(nonatomic,assign)BOOL isdefaultflag;
@property(nonatomic,assign) int show_count;

+(Resume *)getResumeFromDic:(NSDictionary *)dic;
@end
