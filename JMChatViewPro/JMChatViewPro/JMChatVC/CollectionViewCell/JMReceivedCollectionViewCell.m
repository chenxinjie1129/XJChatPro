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
    
    [self.chatBgImage setupImagewithCoverImageName:XJImage];
}



@end
