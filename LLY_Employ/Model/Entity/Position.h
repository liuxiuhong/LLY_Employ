//
//  Position.h
//  zhiliang_text
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Position : NSObject
@property(nonatomic,retain)NSString *job_number;
@property(nonatomic,retain)NSString *job_title;
@property(nonatomic,retain)NSString *job_city_region;
@property(nonatomic,retain)NSString *company_id;
@property(nonatomic,retain)NSString *company_number;
@property(nonatomic,retain)NSString *company_name;
@property(nonatomic,retain)NSString *country_id;
@property(nonatomic,retain)NSString *province_id;
@property(nonatomic,retain)NSString *city_id;
@property(nonatomic,retain)NSString *company_short_name;
@property(nonatomic,retain)NSString *date_opening;
@property(nonatomic,retain)NSString *important;
@property(nonatomic,retain)NSString *job_city;

+(Position *)getPositionFromDic:(NSDictionary *)dic;
@end
