//
//  XJImageCollectionViewCell.h
//  JMChatViewPro
//
//  Created by admin on 15/12/8.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMBasicCollectionViewCell.h"

@interface XJImageCollectionViewCell : JMBasicCollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *chatImageView;

-(void)setModel:(JMChatModel *)model;

@end
