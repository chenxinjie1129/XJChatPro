//
//  XJCustomLayout.m
//  JMChatViewPro
//
//  Created by admin on 15/12/9.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "XJCustomLayout.h"
#define screen_size_width [[UIScreen mainScreen] bounds].size.width

@interface XJCustomLayout ()
{
    /**
     保存每一列的高度
     */
    NSMutableArray *_columnHeightArray;
    
    /**
     保存所有的item的信息
     */
    NSMutableArray *_itemAttributeArray;
    /**
     每一行最高度
     */
    CGFloat maxHeightOfRow;
    
    NSMutableArray *_sectionAttributeArray;
}

@end

@implementation XJCustomLayout

- (instancetype)init
{
    if (self = [super init])
    {
        self.headerReferenceSize = CGSizeMake(screen_size_width, 40);
        _sectionInsets = UIEdgeInsetsMake(40, 0, 0, 20);
        _columnCount = 3;
        _interSpace = 5;
    }
    
    return self;
}

/**
 获取最大高度列的下标
 */
- (NSInteger)longestColomnHeight
{
    //记录最大值
    __block NSInteger longestHeight = 0;
    //记录最大值的下标
    __block NSInteger index = 0;
    
    //查找最大列
    [_columnHeightArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         //数组里面的每个元素与最大值进行比较
         if ([obj integerValue] > longestHeight)
         {
             //记录最大值
             longestHeight = [obj integerValue];
             
             //停止循环
             //*stop = YES;
             
             //记录最大值的下标
             index = idx;
         }
     }];
    
    return index;
}

/**
 获取最小高度列的下标
 */
- (NSInteger)shortestColomnHeight
{
    //记录最小值
    __block NSInteger shortestHeight = MAXFLOAT;
    //记录最小值的下标
    __block NSInteger index = 0;
    
    
    //查找最小列
    [_columnHeightArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         if ([obj integerValue] < shortestHeight)
         {
             //记录最小值
             shortestHeight = [obj integerValue];
             
             //停止循环
             //*stop = YES;
             
             //记录最小值的下标
             index = idx;
         }
     }];
    
    return index;
}

//刷新或者重新布局的时候会自动触发
- (void)prepareLayout
{
    [super prepareLayout];
    
    
    _delegate = (id<CustomLayoutDelegate>)self.collectionView.delegate;
    
    
    if (!self.isInset) {
        _columnHeightArray = [NSMutableArray array];
        _itemAttributeArray = [NSMutableArray array];
        
        _sectionAttributeArray = [NSMutableArray array];
        
        maxHeightOfRow = 0;
        
        //布局item
        for (int i = 0; i < _columnCount; i++)
        {
            //每一列高度默认是0
            [_columnHeightArray addObject:@(0)];
            
        }
        //布局item
        
        //设置每个item的坐标
        
        for (int k = 0; k < [self.collectionView numberOfSections]; k ++) {
            
            NSInteger totalItemW = 0;
            
            UIEdgeInsets itemEdgeInsets = [_delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:k];
            
            CGSize sectionSize = [_delegate collectionView:self.collectionView layout:self referenceSizeForHeaderInSection:k];
            
            UICollectionViewLayoutAttributes *sectionAttributes = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:k]];
            
            for (int i = 0; i < [self.collectionView numberOfItemsInSection:k]; i++)
            {
                
                
                //item的高度
                NSInteger itemHeight = 0;
                //item的x
                NSInteger xOffset = 0;
                //item的y
                NSInteger yOffset = 0;
                
                /*
                 取数据
                 */
                CGSize itemSize = [_delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:k]];
                
                
                self.sectionInsets = itemEdgeInsets;
                
                //每个item的宽度
                
                NSInteger itemWidth = itemSize.width;
                
                //计算item的高度
                itemHeight = itemSize.height;
                
                xOffset =   itemEdgeInsets.left + totalItemW + 5;
                
                //x坐标
                totalItemW = totalItemW + itemWidth;
                
                
                //y坐标
                yOffset =  maxHeightOfRow +_interSpace + sectionSize.height;
                
                sectionAttributes.frame = CGRectMake(0, yOffset - sectionSize.height, screen_size_width, 20);
                
                //保存的是item的属性
                UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:k]];
                //设置坐标
                attribute.frame = CGRectMake(xOffset, yOffset, itemWidth, itemHeight);
                
                
                //修改高度
                _columnHeightArray[i%_columnCount] = @(CGRectGetMaxY(attribute.frame));
                
                //保存item信息
                [_itemAttributeArray addObject:attribute];
                
                //获取每一行最大高度
                if (i%_columnCount == (_columnCount-1)) {
                    
                    maxHeightOfRow = [_columnHeightArray[[self longestColomnHeight]] floatValue];
                    
                    
                }
            
                
            }
            if (sectionAttributes != nil) {
                [_sectionAttributeArray addObject:sectionAttributes];
            }
            
        }
    }

else{

        NSInteger sectionNum = [self.collectionView numberOfSections];
        NSInteger totalItemW = 0;
        
        UIEdgeInsets itemEdgeInsets = [_delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:sectionNum-1];
        
        CGSize sectionSize = [_delegate collectionView:self.collectionView layout:self referenceSizeForHeaderInSection:sectionNum-1];
        
        UICollectionViewLayoutAttributes *sectionAttributes = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:sectionNum-1]];
        
        for (int i = 0; i < [self.collectionView numberOfItemsInSection:sectionNum-1]; i++)
        {
            
            
            //item的高度
            NSInteger itemHeight = 0;
            //item的x
            NSInteger xOffset = 0;
            //item的y
            NSInteger yOffset = 0;
            
            /*
             取数据
             */
            CGSize itemSize = [_delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:sectionNum-1]];
            
            
            self.sectionInsets = itemEdgeInsets;
            
            //每个item的宽度
            
            NSInteger itemWidth = itemSize.width;
            
            //计算item的高度
            itemHeight = itemSize.height;
            
            xOffset =   itemEdgeInsets.left + totalItemW + 5;
            
            //x坐标
            totalItemW = totalItemW + itemWidth;
            
            
            //y坐标
            yOffset =  maxHeightOfRow +_interSpace + sectionSize.height;
            
            sectionAttributes.frame = CGRectMake(0, yOffset - sectionSize.height, screen_size_width, 20);
            
            //保存的是item的属性
            UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:sectionNum-1]];
            //设置坐标
            attribute.frame = CGRectMake(xOffset, yOffset, itemWidth, itemHeight);
            
            
            //修改高度
            _columnHeightArray[i%_columnCount] = @(CGRectGetMaxY(attribute.frame));
            
            //保存item信息
            [_itemAttributeArray addObject:attribute];
            
            //获取每一行最大高度
            if (i%_columnCount == (_columnCount-1)) {
                
                maxHeightOfRow = [_columnHeightArray[[self longestColomnHeight]] floatValue];
                
            }
          
            
        }
        if (sectionAttributes != nil) {
            [_sectionAttributeArray addObject:sectionAttributes];
        }

    }
    
    
    
}



//返回指定区域的collectionView 上的子视图的属性
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    
    [layoutAttributes  addObjectsFromArray:_itemAttributeArray];
    
    [layoutAttributes addObjectsFromArray:_sectionAttributeArray];
    
    
    return layoutAttributes;
}

//返回指定item的属性
//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (self.isInset) {
//        return _itemAttributeArray[indexPath.row];
//    };
//    return nil;
//    
//}

//返回collectionViewContentSize
- (CGSize)collectionViewContentSize
{
    //获取组大值的下标
    NSInteger longest = [self longestColomnHeight];
    
    return CGSizeMake(self.collectionView.frame.size.width, [_columnHeightArray[longest] floatValue] + _sectionInsets.bottom);
}


@end

