//
//  Article.m
//  zhiliang_text
//
//  Created by Ibokan on 13-2-20.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "Article.h"
#import "NSString+RemoveSpaceAndReturn.h"

@implementation Article
- (void)dealloc
{
    self.author = nil;
    self.content = nil;
    self.ID = nil;
    self.startdate = nil;
    self.subtitle = nil;
    self.title = nil;
    
    [super dealloc];
}
+(Article *)articleWithDic:(NSDictionary*)dic
{
    Article *article = [[Article alloc]init];
    article.author = [[[dic valueForKey:@"author"] valueForKey:@"text"] removeSpaceAndReturn];
    article.content = [[[dic valueForKey:@"content"] valueForKey:@"text"] removeSpaceAndReturn];
    article.ID = [[[dic valueForKey:@"ID"] valueForKey:@"text"] removeSpaceAndReturn];
    article.startdate = [[[dic valueForKey:@"startdate"] valueForKey:@"text"] removeSpaceAndReturn];
    article.subtitle = [[[dic valueForKey:@"subtitle"] valueForKey:@"text"] removeSpaceAndReturn];
    article.title = [[[dic valueForKey:@"title"] valueForKey:@"text"] removeSpaceAndReturn];
    return article;
}
@end
