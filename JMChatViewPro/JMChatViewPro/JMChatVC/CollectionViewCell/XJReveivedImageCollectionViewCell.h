//
//  XJReveivedImageCollectionViewCell.h
//  JMChatViewPro
//
//  Created by admin on 15/12/8.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMBasicCollectionViewCell.h"

@interface XJReveivedImageCollectionViewCell : JMBasicCollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *chatImageView;

@property (copy, nonatomic) NSValue *myValue;

@end
