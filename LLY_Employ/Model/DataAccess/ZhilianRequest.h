//
//  ZhilianRequest.h
//  zhiliang_text
//
//  Created by Ibokan on 13-2-21.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZhilianRequest;
typedef  void (^ZhilianBlock)(ZhilianRequest *request,id obj);
@interface ZhilianRequest : NSObject<NSURLConnectionDataDelegate>
{
    NSMutableURLRequest *_request;
    NSURLConnection *_connection;
    NSMutableData *_data;
}

@property(nonatomic,copy)ZhilianBlock resultBlock;
@property(nonatomic,copy)ZhilianBlock failBlock;
@property(nonatomic,copy)ZhilianBlock responseBlock;
@property(nonatomic,copy)ZhilianBlock rawDataBlock;

-(void)requestWithURLStr:(NSString *)urlStr HttpMethod:(NSString *)httpMethod ParameterDic:(NSDictionary *)parameterDic;

-(void)connect;
-(void)cancel;

@end
