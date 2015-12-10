//
//  JMContentCollectionViewCell.m
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "JMContentCollectionViewCell.h"
#import "UIImageView+XJExtension.h"

@implementation JMContentCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.chatBgImage setupImagewithCoverImageName:XJReceivedImage];
   
}



@end

