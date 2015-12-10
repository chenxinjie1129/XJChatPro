//
//  JMChatModel.h
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JMChatDefine.h"
#define headerSizeWith 50
typedef enum : NSUInteger {
    JMCONTENT,
    JMIMAGE,
    JMCONTENTANDIMAGE,
} CONTENT_TYPE;

typedef enum : NSUInteger {
    CHAT_TO,
    CHAT_FROM
} CHAT_TYPE;

@interface JMChatModel : NSObject

@property (nonatomic,assign) CONTENT_TYPE contentType;
@property (nonatomic,assign) CHAT_TYPE chatType;
@property (nonatomic,assign) NSString *strUserImage;
@property (nonatomic,strong) NSString *strURLImage;
@property (nonatomic,strong) NSString *strContent;
@property (nonatomic,strong) NSString *strName;

/**
 *  如果对nCreateDate赋值，自动复制给strDate.
 */
@property (nonatomic,assign) NSInteger nCreateDate;

@property (nonatomic,strong) NSString *strDate;


/**
 *  这几个方法是自带属性，对strContent赋值，就可以了。
 */

@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;

@property (nonatomic,assign)CGSize cellSize;


@end
