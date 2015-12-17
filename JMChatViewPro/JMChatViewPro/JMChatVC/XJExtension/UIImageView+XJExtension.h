//
//  UIImageView+XJExtension.h
//  JMChatViewPro
//
//  Created by admin on 15/12/8.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>

#define XJImage @"bubble_left"
#define XJReceivedImage @"bubble_right"

@interface UIImageView (XJExtension)

@property(strong, nonatomic) CALayer      *contentLayer;
@property(strong, nonatomic) CAShapeLayer *maskLayer;
@property(assign, nonatomic) NSValue *myValue;

-(void)setMyImage:(UIImage *)image withNSValue:(NSValue *)value;

-(void)setupImagewithCoverImageName:(NSString *)strCoverImage;

- (void)makeMaskView:(UIView *)view withImage:(UIImage *)image;


@end
