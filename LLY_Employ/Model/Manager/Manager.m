//
//  Manager.m
//  zhiliang_text
//
//  Created by Ibokan on 13-2-20.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "Manager.h"
#import "ZhilianRequest.h"
#import "NSString+RemoveSpaceAndReturn.h"
@implementation Manager



#pragma mark--职位搜索
-(void)searchJobWithDic:(NSDictionary *)dic//返回职位数组
{
    ZhilianRequest *request = [[ZhilianRequest alloc] init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        id result = [[[(NSDictionary *)obj valueForKey:@"result"] valueForKey:@"text"] removeSpaceAndReturn];
        if ([result isEqualToString:@"0"])
        {
            NSString *message = [[[(NSDictionary *)obj valueForKey:@"message"] valueForKey:@"text"] removeSpaceAndReturn];
            NSLog(@"result = %@ ,error message = %@",result,message);
        }
        else
        {
            NSDictionary *result = [obj valueForKey:@"result"];
            if ([[result valueForKey:@"position"] isKindOfClass:[NSArray class]]) {
                NSArray *arr = [(NSDictionary *)result valueForKey:@"position"];
                NSMutableArray *positionArr = [NSMutableArray array];
                for (NSDictionary *positionDic in arr) {
                    NSLog(@"positionDic = %@",positionDic);
                    Position *position = [Position getPositionFromDic:positionDic];
                    [positionArr addObject:position];
                }
                if (self.resultBlock) {
                    self.resultBlock(self,positionArr);
                }
            }
        }
    };
    request.failBlock = ^(ZhilianRequest *request,id obj){
        if (self.errorBlock) {
            self.errorBlock(self,obj);
        }
    };
    [request requestWithURLStr:@"http://wapinterface.zhaopin.com/iphone/search/searchjob.aspx" HttpMethod:@"GET" ParameterDic:dic];
    [request connect];
    [request release];
}
-(void)saveSearcherWithDic:(NSDictionary *)dic
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/search/saveresult.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];

}
-(void)applyJobsWithDic:(NSDictionary *)dic
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/job/batchaddposition.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}
-(void)collectionPositionWithDic:(NSDictionary *)dic
{
   NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/job/collectposition.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}
-(void)searchSameJobWithDic:(NSDictionary *)dic//返回职位数组
{
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"obj = %@",obj);
        NSArray *arr = [obj valueForKey:@"position"];
        NSMutableArray *positionArr = [NSMutableArray array];
        for (NSDictionary *positionDic  in arr) {
            Position *position = [Position getPositionFromDic:positionDic];
            [positionArr addObject:position];
        }
        if (self.resultBlock) {
            self.resultBlock(self,positionArr);
        }
    };
    
    request.failBlock = ^(ZhilianRequest *request,id obj){
        if (self.errorBlock) {
            self.errorBlock(self,obj);
        }
    };
    [request requestWithURLStr:@"http://wapinterface.zhaopin.com/iphone/search/searchsamejob.aspx" HttpMethod:@"GET" ParameterDic:dic];
    
    [request connect];
    [request release];
}


#pragma mark--我的智联
-(void)loginWithLoginname:(NSString *)loginname Password:(NSString *)password//返回zhilian对象
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:loginname forKey:@"loginname"];
    [dic setValue:password forKey:@"password"];
    
    ZhilianRequest *request = [[ZhilianRequest alloc] init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result = %@",obj);
        NSString *result = [[[(NSDictionary *)obj valueForKey:@"result"] valueForKey:@"text"] removeSpaceAndReturn];
        if ([result isEqualToString:@"1"]) {
            NSLog(@"zhiliangDic = %@",obj);
            ZhiLian *zhilian = [ZhiLian getZhilianFromDic:(NSDictionary *)obj];
            if (self.resultBlock) {
                self.resultBlock(self,zhilian);
            }
        }
        else{
            NSLog(@"result = %@",result);
            NSString *message = [[[(NSDictionary *)obj valueForKey:@"message"] valueForKey:@"text"] removeSpaceAndReturn];
            NSLog(@"error message = %@",message);
        }
    };
    request.failBlock = ^(ZhilianRequest *request,id obj){
        if (self.errorBlock) {
            self.errorBlock(self,obj);
        }
    };
    [request requestWithURLStr:@"http://wapinterface.zhaopin.com/iphone/myzhaopin/loginmgr/login.aspx" HttpMethod:@"GET" ParameterDic:dic];
    [request connect];
    [request release];
}
-(void)getForgetPasswordWithDic:(NSDictionary *)dic  
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/loginmgr/forgetpwd.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}
-(void)registerNewIDWithDic:(NSDictionary *)dic//未完成 返回zhilian实体
{
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"obj = %@",obj);
        if (self.resultBlock) {
            self.resultBlock(self,obj);
        }
    };
    [request requestWithURLStr:@"http://wapinterface.zhaopin.com/iphone/myzhaopin/loginmgr/register.aspx" HttpMethod:@"GET" ParameterDic:dic];
    
    [request connect];
    [request release];
}

-(void)setDefaultResumeWithDic:(NSDictionary *)dic
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/setdefaultresume.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}

-(void)getShowResumeCompanyListWithDic:(NSDictionary *)dic//未完成  返回company数组
{
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"obj = %@",obj);
        if (self.resultBlock) {
            self.resultBlock(self,obj);
        }
    };
    [request requestWithURLStr:@"http://wapinterface.zhaopin.com/iphone/myzhaopin/getcompanylist_showresume.aspx" HttpMethod:@"GET" ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)getCompanyDetailWithDic:(NSDictionary *)dic//未完成 返回company实体
{
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"obj = %@",obj);
        if (self.resultBlock) {
            self.resultBlock(self,obj);
        }
    };
    [request requestWithURLStr:@"http://wapinterface.zhaopin.com/iphone/company/showcompanydetail.aspx" HttpMethod:@"GET" ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)getHREmailWithDic:(NSDictionary *)dic;//未完成 返回email数组
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/get_hr_email_list.aspx";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)getEmailDetailWithDic:(NSDictionary *)dic//未完成 返回email实体
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/jobmng_showmail.aspx";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)deleteEmailWithDic:(NSDictionary *)dic
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/jobmng_mail_del.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}
-(void)getApplyJobListWithDic:(NSDictionary *)dic//未完成 返回position数组
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/jobmng_applist.aspx";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)getJobDetailWithDic:(NSDictionary *)dic//未完成 返回position实体
{
    NSString *urlStr = @"http://wapinterface.zhaopin.co/iphone/job/showjobdetail.aspx";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)getCollectionListWithDic:(NSDictionary *)dic//未完成 返回position数组或实体
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/jobmng_fav_list.aspx";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)deleteCollectionWithDic:(NSDictionary *)dic
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/jobmng_fav_del.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}
-(void)getJobSearcherWithDic:(NSDictionary *)dic //返回searcher数组 未完成
{ 
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/jobsearcher.aspx";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)addJobSearcherWithDic:(NSDictionary *)dic //返回searcher实体
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/jobsearcher_add.aspx";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)editJobSearcherWithDic:(NSDictionary *)dic
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/jobsearcher_edit.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}
-(void)deleteJobSearcherWithDic:(NSDictionary *)dic
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/jobsearcher_del.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}

-(void)searchNewestJobWithDic:(NSDictionary *)dic//返回position数组 未完成
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/job/searchjobs.aspx";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)setJobSearcherIntervalWithDic:(NSDictionary *)dic
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/jobsearcher_set_interval.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}
-(void)refreshResumeWithDic:(NSDictionary *)dic
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/resume_refresh.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}
-(void)getJobSearcherDetailWithDic:(NSDictionary *)dic//返回seacher实体 未完成
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/myzhaopin/getjobsearcherinfo.aspx";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}

#pragma mark--求职指导
-(void)getChannelListWithDic:(NSDictionary *)dic // 未完成
{
    NSString *urlStr = @"http://mobileinterface.zhaopin.com/iphone/article/channellist.service";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}
-(void)getArticleListWithDic:(NSDictionary *)dic //返回article 数组 未完成
{
    NSString *urlStr = @"http://mobileinterface.zhaopin.com/iphone/article/articlelist.service";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)getArticleDetailWithDic:(NSDictionary *)dic //返回article实体
{
    NSString *urlStr = @"http://mobileinterface.zhaopin.com/iphone/article/articledetail.service";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}

#pragma mark--薪资查询
-(void)getPayQueryListWithDic:(NSDictionary *)dic 
{
    NSString *urlStr = @"http://mobileinterface.zhaopin.com/iphone/payquery/querylist.service";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}
-(void)PayQueryWithDic:(NSDictionary *)dic//返回查询结果和position数组
{
    NSString *urlStr = @"http://mobileinterface.zhaopin.com/iphone/payquery/query.service";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}
-(void)PayqueryCompareWithDic:(NSDictionary *)dic
{
    NSString *urlStr = @"http://mobileinterface.zhaopin.com/iphone/payquery/query.service";
    NSString *httpMethod = @"GET";
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
        }
    };
    request.failBlock= ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            
        }
    };
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
    
    [request connect];
    [request release];
}
#pragma mark--实时推荐
-(void)getJobRecommendWithDic:(NSDictionary *)dic
{
    NSString *urlStr = @"http://mobileinterface.zhaopin.com/iphone/payquery/query.service";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}
-(void)changeTpyeRecommendWith:(NSDictionary *)dic
{
    NSString *urlStr = @"http://wapinterface.zhaopin.com/iphone/job/getjob.aspx";
    NSString *httpMethod = @"GET";
    [self requestWithUrlStr:urlStr HttpMethod:httpMethod ParameterDic:dic];
}

//当返回参数不需要实例化时，调用以下方法请求数据
-(void)requestWithUrlStr:(NSString *)urlStr HttpMethod:(NSString *)httpMethod ParameterDic:(NSDictionary *)parameterDic
{
    ZhilianRequest *request = [[ZhilianRequest alloc]init];
    [request requestWithURLStr:urlStr HttpMethod:httpMethod ParameterDic:parameterDic];
    request.resultBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"result obj = %@",obj);
        if (self.resultBlock) {
            self.resultBlock(self,obj);
        }
    };
    request.failBlock = ^(ZhilianRequest *request,id obj){
        NSLog(@"error obj = %@",obj);
        if (self.errorBlock) {
            self.errorBlock(self,obj);
        }
    };
    [request connect];
    [request release];
}
@end
