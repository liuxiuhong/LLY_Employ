//
//  ZhiLian.m
//  zhiliang_text
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "ZhiLian.h"
#import "Resume.h"
#import "XMLReader.h"
#import "NSString+RemoveSpaceAndReturn.h"
@implementation ZhiLian
- (void)dealloc
{
    self.uticket = nil;
    self.resumelist = nil;
    [super dealloc];
}

+(ZhiLian *)getZhilianFromDic:(NSDictionary *)dic
{
    ZhiLian *zhilian = [[self alloc]init];

    zhilian.apply_count = [[[dic valueForKey:@"apply_count"] valueForKey:@"text"] intValue];
    zhilian.fav_count  = [[[dic valueForKey:@"fav_count"] valueForKey:@"text"] intValue];
    zhilian.job_searcher_count = [[[dic valueForKey:@"job_searcher_count"] valueForKey:@"text"] intValue];
    zhilian.no_read = [[[dic valueForKey:@"no_read_hr_email_count"] valueForKey:@"text"] intValue];
    zhilian.uticket = [[[dic valueForKey:@"uticket"] valueForKey:@"text"] removeSpaceAndReturn];
    
    NSDictionary *resume_list = [dic valueForKey:@"resumelist"];
    if (resume_list) {
        zhilian.resumelist = [NSMutableArray array];
        if ([[resume_list valueForKey:@"resume"] isKindOfClass:[NSDictionary class]]) {//一份简历
            NSDictionary *resumeDic = [resume_list valueForKey:@"resume"];
            Resume *resume =  [Resume getResumeFromDic:resumeDic];
            [zhilian.resumelist addObject:resume];
        }
        else{//多份简历
            NSArray *resumeArr = [resume_list valueForKey:@"resume"];
            for (NSDictionary *resumeDic in resumeArr) {
                Resume *resume =  [Resume getResumeFromDic:resumeDic];
                [zhilian.resumelist addObject:resume];
            }
        }
    }
    return [zhilian autorelease];
}
@end
