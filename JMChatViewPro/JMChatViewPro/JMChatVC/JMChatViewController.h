//
//  JMChatViewController.h
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMCellFactory.h"

/**
 *  必读文件！JMChatModel.!
 */

@interface JMChatViewController : UIViewController

@property (nonatomic,strong)  JMCellFactory *collectionFactory;

@property (weak, nonatomic) IBOutlet UITextField *sendTextField;
@property (weak, nonatomic) IBOutlet UIButton *addSearchBtn;
@property (weak, nonatomic) IBOutlet UICollectionView *chatCollectionView;
@property (weak, nonatomic) IBOutlet UIView *chatBarView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,assign) BOOL hasUserImage;


#pragma mark - 继承专区

/**
 *  需要继承的方法
 *
 *  @param textField
 *
 *  @return 
 */

-(JMChatModel *)sendMsg:(UITextField *)textField;

-(void)selectHeader:(JMChatModel *)model;

-(void)selectContent:(JMChatModel *)model;

-(void)addBtnAction;

#pragma mark - 调用专区
/**
 *  调用方法（注意注意！不能继承！！只能调用！）
 *
 *  @param model
 */

-(void)addMsgNormalAction:(JMChatModel *)model;

/**
 *  检测数据专用
 */
-(void)testData;

@end
