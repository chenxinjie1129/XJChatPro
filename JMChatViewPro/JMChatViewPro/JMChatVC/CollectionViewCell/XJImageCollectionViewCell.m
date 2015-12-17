//
//  XJImageCollectionViewCell.m
//  JMChatViewPro
//
//  Created by admin on 15/12/8.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "XJImageCollectionViewCell.h"
#import "UIImageView+XJExtension.h"

@implementation XJImageCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    
}
-(void)setModel:(JMChatModel *)model
{
    
    UIImage *image = [UIImage imageNamed:XJReceivedImage];
    
    UIEdgeInsets edge=UIEdgeInsetsMake(30, 10, 5,30);
    
    image = [image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
    
    self.chatImageView.image = [UIImage imageNamed:model.strURLImage];

    [self.chatImageView makeMaskView:self.chatImageView withImage:image];

    
    
}


@end
