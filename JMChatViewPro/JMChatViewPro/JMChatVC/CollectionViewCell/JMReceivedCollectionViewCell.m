//
//  JMReceivedCollectionViewCell.m
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "JMReceivedCollectionViewCell.h"
#import "UIImageView+XJExtension.h"

@implementation JMReceivedCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
}
-(void)setModel:(JMChatModel *)model
{
    
    UIImage *image = [UIImage imageNamed:XJImage];
    
    UIEdgeInsets edge=UIEdgeInsetsMake(30, 30, 5,10);
    
    image = [image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
    
    self.chatBgImage.image = image;
    
    self.chatLabel.text = model.strContent;
}


@end
