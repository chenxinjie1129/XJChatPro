//
//  JMHeaderCollectionViewCell.h
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMBasicCollectionViewCell.h"
@interface JMHeaderCollectionViewCell : JMBasicCollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@end
