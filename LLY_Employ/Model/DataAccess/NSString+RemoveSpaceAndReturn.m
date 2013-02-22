//
//  NSString+RemoveSpaceAndReturn.m
//  zhiliang_text
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "NSString+RemoveSpaceAndReturn.h"

@implementation NSString (RemoveSpaceAndReturn)
-(NSString *)removeSpaceAndReturn
{
    
    NSMutableString *mStr = [NSMutableString stringWithString:self];
    NSRange range = NSMakeRange(0, mStr.length-1);
    [mStr replaceOccurrencesOfString:@"\n" withString:@"" options:1 range:range];
    range = NSMakeRange(0, mStr.length-1);
    [mStr replaceOccurrencesOfString:@" " withString:@"" options:1 range:range];
    return mStr;
}

@end
