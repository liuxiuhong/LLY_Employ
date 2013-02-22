//
//  NSMutableString+AppendMD5.h
//  zhiliang_text
//
//  Created by Ibokan on 13-2-19.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSMutableString (AppendMD5)
-(void )appendMd5;

@end
