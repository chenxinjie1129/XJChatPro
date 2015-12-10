//
//  XJCustomLayout.h
//  JMChatViewPro
//
//  Created by admin on 15/12/9.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomLayoutDelegate <UICollectionViewDelegate>

@required

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

@end

@interface XJCustomLayout : UICollectionViewLayout

@property (nonatomic, assign) id<CustomLayoutDelegate> delegate;


/**
 数据源
 */
@property (nonatomic, strong) NSArray *datasourceArray;

/**
 列数,默认是3列
 */
@property (nonatomic, assign) NSInteger columnCount;

/**
 上下左右的空隙
 */
@property (nonatomic, assign) UIEdgeInsets sectionInsets;

/**
 列与列之间的空隙
 */
@property (nonatomic, assign) NSInteger columnSpace;

/**
 行间距
 */
@property (nonatomic, assign) NSInteger interSpace;

@end
