//
//  ArticleList.m
//  zhiliang_text
//
//  Created by Ibokan on 13-2-20.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "ArticleList.h"
#import "NSString+RemoveSpaceAndReturn.h"
@implementation ArticleList
- (void)dealloc
{
    self.name = nil;
    self.ID = nil;
    self.articles = nil;
    [super dealloc];
}
+(ArticleList *)articleListwithDic:(NSDictionary *)dic
{
    ArticleList *articleList = [[ArticleList alloc]init];
    articleList.name = [[[dic valueForKey:@"name"] valueForKey:@"text"] removeSpaceAndReturn];
    articleList.ID = [[dic valueForKey:@"id"] removeSpaceAndReturn];
    articleList.articles = [NSMutableArray array];
  //  NSArray *arr = [dic valueForKey:@"articles"];
  //  if (arr) {
//        for (NSDictionary *articleDic in arr) {
//            NSLog(@"articleDic = %@",articleDic);
//        }
//    }
//    
    return [articleList autorelease];
}
@end
