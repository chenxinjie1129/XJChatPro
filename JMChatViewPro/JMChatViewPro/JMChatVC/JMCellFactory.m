//
//  JMCellFactory.m
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/26.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "JMCellFactory.h"



#import "JMChatDefine.h"
#import "JMFunction.h"
#import "JMHeaderCollectionViewCell.h"
#import "JMContentCollectionViewCell.h"
#import "JMReceivedCollectionViewCell.h"
#import "JMImageCollectionViewCell.h"
#import "JMBasicCollectionViewCell.h"
#import "JMReveivedImageCollectionViewCell.h"
#import "JMSectionHeaderCollectionReusableView.h"
#import "XJImageCollectionViewCell.h"
#import "XJReveivedImageCollectionViewCell.h"
#import "UIImageView+XJExtension.h"


@implementation JMCellFactory



-(void)registerCollectionViewCell:(UICollectionView *)collectionView{
    
    [collectionView registerNib:[UINib nibWithNibName:@"JMHeaderCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:JMHeader];
    
    [collectionView registerNib:[UINib nibWithNibName:@"JMContentCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:JMConetnt];
    [collectionView registerNib:[UINib nibWithNibName:@"JMReceivedCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:JMReceivedContent];
    
//    [collectionView registerNib:[UINib nibWithNibName:@"JMImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:JMImage];
//    
//    [collectionView registerNib:[UINib nibWithNibName:@"JMReveivedImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:JMReceivedImage];
    
    [collectionView registerNib:[UINib nibWithNibName:@"JMSectionHeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JMSectionDate];
    
    [collectionView registerNib:[UINib nibWithNibName:@"XJImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:JMImage];
    
    [collectionView registerNib:[UINib nibWithNibName:@"XJReveivedImageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:JMReceivedImage];

    
}

-(UICollectionViewCell *)setupCollectionForCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model{

    if (model.chatType == CHAT_FROM) {
    
        if (model.contentType == JMCONTENT) {
            
         return   [self setupContentForCell:collectionView cellForItemAtIndexPath:indexPath WithModel:model];
            
        }else {
        
          return  [self setupImageForCell:collectionView cellForItemAtIndexPath:indexPath WithModel:model];
            
        
        }

    
    }else{
        
        
        if (model.contentType == JMCONTENT) {
            
          return  [self setupContentReceivedForCell:collectionView cellForItemAtIndexPath:indexPath WithModel:model];
            
        }else {
            
         return   [self setupImageReceivedForCell:collectionView cellForItemAtIndexPath:indexPath WithModel:model];
            
            
        }
        
    }

}

-(UICollectionReusableView *)setupHeader:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath withModel:(JMChatModel *)model{

    JMSectionHeaderCollectionReusableView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JMSectionDate forIndexPath:indexPath];
    
    
    cell.dateLabel.text = model.strDate;
    
    return cell;


}




-(UICollectionViewCell *)setupHeader:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model{

    JMHeaderCollectionViewCell *cell;
    
    cell  = [collectionView dequeueReusableCellWithReuseIdentifier:JMHeader forIndexPath:indexPath];
    
    cell.hidden = YES;
    
    
    if (model.chatType == CHAT_FROM && indexPath.item == 2) {
        
        [cell.userImageView setImage:[UIImage imageNamed:model.strUserImage]];
        
         cell.userNameLabel.text = model.strName;
        
        cell.hidden = NO;
        
    }else if(model.chatType == CHAT_TO && indexPath.item == 0){
    
        [cell.userImageView setImage:[UIImage imageNamed:model.strUserImage]];
        
        cell.userNameLabel.text = model.strName;
        
        cell.hidden = NO;
        
        
    }
    
    
    return cell;

    


}

-(UICollectionViewCell *)setupContentForCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model{

    JMContentCollectionViewCell* contentCell = [collectionView dequeueReusableCellWithReuseIdentifier:JMConetnt forIndexPath:indexPath];
    
    contentCell.chateType = model.chatType;
    
    NSValue *value = [NSValue valueWithCGSize:model.cellSize];
    
    [contentCell.chatBgImage setMyImage:[UIImage imageNamed:@"chatBgImage"] withNSValue:value];
    
    contentCell.chatLabel.text = model.strContent;

    
    
    return contentCell;


}


-(UICollectionViewCell *)setupContentReceivedForCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model{

    JMReceivedCollectionViewCell* contentCell = [collectionView dequeueReusableCellWithReuseIdentifier:JMReceivedContent forIndexPath:indexPath];
    
    contentCell.chateType = model.chatType;
    
    NSValue *value = [NSValue valueWithCGSize:model.cellSize];
    
    [contentCell.chatBgImage setMyImage:[UIImage imageNamed:@"chatBgImage"] withNSValue:value];
    
    
    contentCell.chatLabel.text = model.strContent;
        
    return contentCell;

}


-(UICollectionViewCell *)setupImageForCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model{
    
    /*
    JMImageCollectionViewCell* contentCell = [collectionView dequeueReusableCellWithReuseIdentifier:JMImage forIndexPath:indexPath];
    
    
    contentCell.chateType = model.chatType;
    
    [contentCell.chatImageView setImage:[UIImage imageNamed:model.strURLImage]];
    
 
    
    return contentCell;
     
    */
    XJImageCollectionViewCell* contentCell = [collectionView dequeueReusableCellWithReuseIdentifier:JMImage forIndexPath:indexPath];
    
    
    contentCell.chateType = model.chatType;
    
    NSValue *value = [NSValue valueWithCGSize:model.cellSize];
    
//    [contentCell.chatImageView setupImagewithCoverImageName:XJReceivedImage];
    
    [contentCell.chatImageView setMyImage:[UIImage imageNamed:model.strURLImage] withNSValue:value];
    
    [contentCell setNeedsDisplay];
    
    
    return contentCell;
     

    
}



-(UICollectionViewCell *)setupImageReceivedForCell:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath WithModel:(JMChatModel *)model{
    
    /*
    JMReveivedImageCollectionViewCell* contentCell = [collectionView dequeueReusableCellWithReuseIdentifier:JMReceivedImage forIndexPath:indexPath];
        
    contentCell.chateType = model.chatType;
    
    [contentCell.chatImageView setImage:[UIImage imageNamed:model.strURLImage]];
    
    NSLog(@"JMReveived %@",model.strURLImage);
    
    
    return contentCell;
     */
    
    XJReveivedImageCollectionViewCell* contentCell = [collectionView dequeueReusableCellWithReuseIdentifier:JMReceivedImage forIndexPath:indexPath];
    
    contentCell.chateType = model.chatType;
    
    NSValue *value = [NSValue valueWithCGSize:model.cellSize];
    
//    [contentCell.chatImageView setupImagewithCoverImageName:XJImage];

    
    [contentCell.chatImageView setMyImage:[UIImage imageNamed:model.strURLImage] withNSValue:value];
    
    [contentCell setNeedsDisplay];
    
    NSLog(@"JMReveived %@",model.strURLImage);
    
    
    return contentCell;

}




@end
