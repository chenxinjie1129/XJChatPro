//
//  JMFunction.m
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "JMFunction.h"

@implementation JMFunction

+(CGFloat)calLabelHeight:(UIFont *)fontSize andStr:(NSString *)str WithSize:(CGSize)size{
    
    
    NSDictionary *attribute = @{NSFontAttributeName: fontSize};
    
    CGSize retSize = [str boundingRectWithSize:size
                                       options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                    attributes:attribute
                                       context:nil].size;
    
    return retSize.height;
    
    
    
}

+(CGFloat)calLabelWidth:(UIFont *)fontSize andStr:(NSString *)str WithSize:(CGSize)size{
    
    
    NSDictionary *attribute = @{NSFontAttributeName: fontSize};
    
    CGSize retSize = [str boundingRectWithSize:size
                                       options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                    attributes:attribute
                                       context:nil].size;
    
    return retSize.width;
    
    
    
}



@end
