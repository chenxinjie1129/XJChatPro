//
//  JMFunction.h
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JMFunction : NSObject

+(CGFloat)calLabelHeight:(UIFont *)fontSize andStr:(NSString *)str WithSize:(CGSize)size;

+(CGFloat)calLabelWidth:(UIFont *)fontSize andStr:(NSString *)str WithSize:(CGSize)size;
@end
