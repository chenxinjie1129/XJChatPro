//
//  UIImageView+XJExtension.m
//  JMChatViewPro
//
//  Created by admin on 15/12/8.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "UIImageView+XJExtension.h"
#import <objc/runtime.h>



@implementation UIImageView (XJExtension)

static void * MyObjectContentLayerPorpertyKey = (void *)@"MyObjectContentLayerPorpertyKey";
static void * MyObjectMaskLayerPorpertyKey = (void *)@"MyObjectMaskLayerPorpertyKey";
static void * MyObjectMyValuePorpertyKey = (void *)@"MyObjectMyValuePorpertyKey";

-(void)setContentLayer:(CALayer *)contentLayer
{
  
    contentLayer.mask = self.maskLayer;
    contentLayer.frame = self.bounds;
    [self.layer addSublayer:contentLayer];
    
     objc_setAssociatedObject(self, MyObjectContentLayerPorpertyKey, contentLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CALayer *)contentLayer
{
    
    return objc_getAssociatedObject(self, MyObjectContentLayerPorpertyKey);
}
-(void)setMaskLayer:(CAShapeLayer *)maskLayer
{
    
    maskLayer.fillColor = [UIColor blackColor].CGColor;
    maskLayer.strokeColor = [UIColor redColor].CGColor;
    maskLayer.frame = self.bounds;
    
    maskLayer.contentsCenter = CGRectMake(0.3, 0.7, 0.4, 0.2);
    //拉伸
    maskLayer.contentsScale = [UIScreen mainScreen].scale;//图片不会变形
    
    objc_setAssociatedObject(self, MyObjectMaskLayerPorpertyKey, maskLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(CAShapeLayer *)maskLayer
{
   
    return objc_getAssociatedObject(self, MyObjectMaskLayerPorpertyKey);
}
-(void)setMyValue:(NSValue *)myValue
{
    
    objc_setAssociatedObject(self, MyObjectMyValuePorpertyKey, myValue, OBJC_ASSOCIATION_ASSIGN);
}
-(NSValue *)myValue
{
    return objc_getAssociatedObject(self, MyObjectMyValuePorpertyKey);
}

-(void)setupImagewithCoverImageName:(NSString *)strCoverImage{
    
    self.maskLayer = [CAShapeLayer layer];
    self.contentLayer = [CALayer layer];
    
    self.maskLayer.contents = (id)[UIImage imageNamed:strCoverImage].CGImage;
    
    


}

-(void)setMyImage:(UIImage *)image withNSValue:(NSValue *)value
{
    self.myValue = value;
    
    CGSize maskLayerSize = [self.myValue CGSizeValue];
    CGRect maskLayerFrame = self.maskLayer.frame;
    maskLayerFrame.size = maskLayerSize;
    self.maskLayer.frame = maskLayerFrame;
    
    CGSize contentLayerSize = [self.myValue CGSizeValue];
    CGRect contentLayerFrame = self.contentLayer.frame;
    contentLayerFrame.size = contentLayerSize;
    self.contentLayer.frame = contentLayerFrame;
    
    self.contentLayer.contents = (id)image.CGImage;
}

@end
