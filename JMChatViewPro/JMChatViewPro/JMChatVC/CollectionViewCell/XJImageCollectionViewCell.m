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
    
    [self.chatImageView setupImagewithCoverImageName:XJReceivedImage];
    
}
//-(void)prepareForReuse
//{
//    [super prepareForReuse];
//    
//    [self.chatImageView setMyImage:nil withNSValue:nil];
//}


@end
