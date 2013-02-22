//
//  Position.m
//  zhiliang_text
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "Position.h"
#import "XMLReader.h"
#import "NSString+RemoveSpaceAndReturn.h"
@implementation Position
- (void)dealloc
{
    self.job_number = nil;
    self.job_title = nil;
    self.job_city_region = nil;
    self.company_id = nil;
    self.company_name = nil;
    self.company_number = nil;
    self.country_id = nil;
    self.province_id = nil;
    self.city_id = nil;
    self.company_short_name = nil;
    self.date_opening = nil;
    self.important = nil;
    
    [super dealloc];
}
+(Position *)getPositionFromDic:(NSDictionary *)dic
{
    Position *position = [[Position alloc]init];
    position.city_id = [[[dic valueForKey:@"city_id"] valueForKey:@"text"] removeSpaceAndReturn];
    
    position.company_id = [[[dic valueForKey:@"company_id"] valueForKey:@"text"] removeSpaceAndReturn];

    position.company_name = [[[dic valueForKey:@"company_name"] valueForKey:@"text"] removeSpaceAndReturn];

    position.company_number = [[[dic valueForKey:@"company_number"] valueForKey:@"text"] removeSpaceAndReturn];

    position.company_short_name = [[[dic valueForKey:@"company_short_name"] valueForKey:@"text"] removeSpaceAndReturn];

    position.country_id = [[[dic valueForKey:@"country_id"] valueForKey:@"text"] removeSpaceAndReturn];
    position.date_opening = [[[dic valueForKey:@"date_opening"] valueForKey:@"text"] removeSpaceAndReturn];
    position.important = [[[dic valueForKey:@"important"] valueForKey:@"text"] removeSpaceAndReturn];
    position.job_city = [[[dic valueForKey:@"job_city"] valueForKey:@"text"] removeSpaceAndReturn];
    position.job_city_region = [[[dic valueForKey:@"job_city_region"] valueForKey:@"text"] removeSpaceAndReturn];
    position.job_number = [[[dic valueForKey:@"job_number"] valueForKey:@"text"] removeSpaceAndReturn];
    position.job_title = [[[dic valueForKey:@"job_title"] valueForKey:@"text"] removeSpaceAndReturn];
    position.province_id = [[[dic valueForKey:@"province_id"] valueForKey:@"text"] removeSpaceAndReturn];

    return [position autorelease];
}
@end
