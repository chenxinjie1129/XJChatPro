//
//  JMReceivedCollectionViewCell.h
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMBasicCollectionViewCell.h"
@interface JMReceivedCollectionViewCell : JMBasicCollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *chatLabel;
@property (weak, nonatomic) IBOutlet UIImageView *chatBgImage;

@end
