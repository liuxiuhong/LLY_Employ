//
//  ZhilianRequest.m
//  zhiliang_text
//
//  Created by Ibokan on 13-2-21.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "ZhilianRequest.h"
#import "NSMutableString+AppendMD5.h"
#import "NSString+RemoveSpaceAndReturn.h"
#import "URLEncode.h"
#import "XMLReader.h"
@implementation ZhilianRequest
- (void)dealloc
{
    self.resultBlock = nil;
    self.responseBlock = nil;
    self.failBlock = nil;
    self.rawDataBlock = nil;
    [_data release];
    [_request release];
    [_connection cancel];
    [_connection release];
    [super dealloc];
}

-(void)requestWithURLStr:(NSString *)urlStr HttpMethod:(NSString *)httpMethod ParameterDic:(NSDictionary *)parameterDic
{
    if ([httpMethod isEqualToString:@"GET"]) {
        NSMutableString *url_str = [NSMutableString stringWithFormat:@"%@?",urlStr];
        for (NSString *key in [parameterDic allKeys]) {
            NSString *value = [parameterDic valueForKey:key];
            [url_str appendFormat:@"%@=%@&",key,[URLEncode encodeUrlStr:value]];
        }
        [url_str appendString:@"f=p"];
        [url_str appendMd5];
        NSURL *url = [NSURL URLWithString:url_str];
        _request = [[NSMutableURLRequest alloc]initWithURL:url];
        [_request setHTTPMethod:@"GET"];
        [_request addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [_request addValue:0 forHTTPHeaderField:@"Content-Length"];
    }
    else{
        NSMutableString *url_str = [NSMutableString stringWithFormat:@"%@",urlStr];
        [url_str appendMd5];
        NSURL *url = [NSURL URLWithString:url_str];
        _request = [[NSMutableURLRequest alloc]initWithURL:url];
        NSMutableString *postStr = [NSMutableString string];
        for (NSString *key in [parameterDic allKeys]) {
            NSString *value = [parameterDic valueForKey:key];
            [postStr appendFormat:@"%@=%@&",key,[URLEncode encodeUrlStr:value]];
        }
        [postStr appendString:@"f=p"];
        NSString *length = [NSString stringWithFormat:@"%d",postStr.length];
        [_request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [_request addValue:length forHTTPHeaderField:@"Content-Length"];
        [_request setHTTPMethod:@"POST"];
        [_request setHTTPBody: [postStr dataUsingEncoding:NSUTF8StringEncoding]];
        
    }
}

-(void)connect
{
    _connection = [[NSURLConnection alloc]initWithRequest:_request delegate:self];
}

-(void)cancel
{
    [_connection cancel];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _data = [[NSMutableData alloc]init];
    if (self.responseBlock) {
        self.responseBlock(self,response);
    }
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
    if (self.rawDataBlock) {
        self.rawDataBlock(self,data);
    }
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *error = nil;
    NSDictionary *dic = [XMLReader dictionaryForXMLData:_data error:&error];
    if (error) {
        NSLog(@"xmlreader error = %@",error.localizedDescription);
    }
    else{
        self.resultBlock(self,[dic valueForKey:@"root"]);
    }
    
}
@end
