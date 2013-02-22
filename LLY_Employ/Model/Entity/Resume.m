//
//  Resume.m
//  zhiliang_text
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "Resume.h"
#import "NSString+RemoveSpaceAndReturn.h"
@implementation Resume
- (void)dealloc
{
    self.resume_id = nil;
    self.resume_name = nil;
    self.version_number = nil;
    self.resume_name = nil;
    
    [super dealloc];
}
+(Resume *)getResumeFromDic:(NSDictionary *)dic
{
    Resume *resume = [[Resume alloc]init];
    
    resume.isdefaultflag = [[[dic valueForKey:@"isdefaultflag"] valueForKey:@"text"] boolValue];
    resume.resume_id = [[[dic valueForKey:@"resume_id"] valueForKey:@"text"] removeSpaceAndReturn];
    resume.resume_name = [[[dic valueForKey:@"resume_name"] valueForKey:@"text"] removeSpaceAndReturn];;
    resume.resume_number = [[[dic valueForKey:@"resume_number"] valueForKey:@"text"] removeSpaceAndReturn];
    resume.show_count = [[[dic valueForKey:@"show_count"] valueForKey:@"text"] intValue];
    return [resume autorelease];
}
@end


