//
//  JMCellFactory.h
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/26.
//  Copyright © 2015年 梁继明. All rights reserved.
//

/**
 *  工厂方法，专业制造30年
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JMChatModel.h"



#define JMHeader @"JMHeader"
#define JMConetnt @"JMContent"
#define JMReceivedContent @"JMReceivedContent"

#define JMImage  @"JMImage"
#define JMReceivedImage @"JMReceivedImage"

#define JMSectionDate @"JMSectionDate"

@interface JMCellFactory : NSObject

-(void)registerCollectionViewCell:(UICollectionView *)collectionView;

-(UICollectionViewCell *)setupHeader:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model;

/**
 *  总制造方法
 *
 *  @param collectionView
 *  @param indexPath
 *  @param model
 *
 *  @return 返回子类；
 */
-(UICollectionViewCell *)setupCollectionForCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model;

/**
 *  头部的时间制造方法
 *
 *  @param collectionView
 *  @param indexPath
 *  @param model
 *
 *  @return 
 */
-(UICollectionReusableView *)setupHeader:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath withModel:(JMChatModel *)model;


-(UICollectionViewCell *)setupContentForCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model;


-(UICollectionViewCell *)setupContentReceivedForCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model;


-(UICollectionViewCell *)setupImageForCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model;


-(UICollectionViewCell *)setupImageReceivedForCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model;


@end
