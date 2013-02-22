//
//  Manager.h
//  zhiliang_text
//
//  Created by Ibokan on 13-2-20.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZhiLian.h"
#import "Resume.h"
#import "Position.h"
#import "Article.h"
#import "Company.h"
@class Manager;
typedef void (^ ManagerBlock) (Manager *manager,id obj);
@interface Manager : NSObject

@property(nonatomic,copy)ManagerBlock resultBlock;
@property(nonatomic,copy)ManagerBlock errorBlock;

-(void)loginWithLoginname:(NSString *)loginname Password:(NSString *)password;//登录

-(void)searchJobWithDic:(NSDictionary *)dic;
-(void)saveSearcherWithDic:(NSDictionary *)dic;
-(void)applyJobsWithDic:(NSDictionary *)dic;
-(void)collectionPositionWithDic:(NSDictionary *)dic;
-(void)searchSameJobWithDic:(NSDictionary *)dic;
-(void)getForgetPasswordWithDic:(NSDictionary *)dic;
-(void)registerNewIDWithDic:(NSDictionary *)dic;
-(void)setDefaultResumeWithDic:(NSDictionary *)dic;
-(void)getShowResumeCompanyListWithDic:(NSDictionary *)dic;
-(void)getCompanyDetailWithDic:(NSDictionary *)dic;

-(void)getHREmailWithDic:(NSDictionary *)dic;
-(void)getEmailDetailWithDic:(NSDictionary *)dic;
-(void)deleteEmailWithDic:(NSDictionary *)dic;
-(void)getApplyJobListWithDic:(NSDictionary *)dic;
-(void)getJobDetailWithDic:(NSDictionary *)dic;
-(void)getCollectionListWithDic:(NSDictionary *)dic;
-(void)deleteCollectionWithDic:(NSDictionary *)dic;
-(void)getJobSearcherWithDic:(NSDictionary *)dic;
-(void)addJobSearcherWithDic:(NSDictionary *)dic;
-(void)editJobSearcherWithDic:(NSDictionary *)dic;
-(void)deleteJobSearcherWithDic:(NSDictionary *)dic;

-(void)searchNewestJobWithDic:(NSDictionary *)dic;
-(void)setJobSearcherIntervalWithDic:(NSDictionary *)dic;
-(void)refreshResumeWithDic:(NSDictionary *)dic;
-(void)getJobSearcherDetailWithDic:(NSDictionary *)dic;

-(void)getChannelListWithDic:(NSDictionary *)dic;
-(void)getArticleListWithDic:(NSDictionary *)dic;
-(void)getArticleDetailWithDic:(NSDictionary *)dic;

-(void)getPayQueryListWithDic:(NSDictionary *)dic;
-(void)PayQueryWithDic:(NSDictionary *)dic;
-(void)PayqueryCompareWithDic:(NSDictionary *)dic;
-(void)getJobRecommendWithDic:(NSDictionary *)dic;
-(void)changeTpyeRecommendWith:(NSDictionary *)dic;

@end
