//
//  XJReveivedImageCollectionViewCell.m
//  JMChatViewPro
//
//  Created by admin on 15/12/8.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "XJReveivedImageCollectionViewCell.h"
#import "UIImageView+XJExtension.h"

@implementation XJReveivedImageCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
}
-(void)setModel:(JMChatModel *)model
{
    
    UIImage *image = [UIImage imageNamed:XJImage];
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 5,10) resizingMode:UIImageResizingModeStretch];
    
//    [self.chatImageView setImageWithURLStr:model.strURLImage andPlaceHolder:@"empty_BGM"];
    //
    self.chatImageView.image = [UIImage imageNamed:model.strURLImage];
    
    [self.chatImageView makeMaskView:self.chatImageView withImage:image];
    
    
    
}


@end
