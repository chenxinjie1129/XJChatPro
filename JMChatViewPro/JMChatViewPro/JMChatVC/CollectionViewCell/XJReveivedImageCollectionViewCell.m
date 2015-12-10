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
    
    [self.chatImageView setupImagewithCoverImageName:XJImage];
}
//-(void)prepareForReuse
//{
//    [super prepareForReuse];
//    
//    [self.chatImageView setMyImage:nil withNSValue:nil];
//}


@end
