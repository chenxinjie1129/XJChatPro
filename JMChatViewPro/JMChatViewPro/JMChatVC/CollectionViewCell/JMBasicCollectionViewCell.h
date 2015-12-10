//
//  JMBasicCollectionViewCell.h
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMChatModel.h"

@interface JMBasicCollectionViewCell : UICollectionViewCell

//@property (weak, nonatomic) IBOutlet UIImageView *chatBGImageView;

@property (nonatomic,assign) CHAT_TYPE chateType;

@end
