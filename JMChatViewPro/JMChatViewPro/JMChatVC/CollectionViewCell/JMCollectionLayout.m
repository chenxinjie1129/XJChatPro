//
//  JMCollectionLayout.m
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/27.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "JMCollectionLayout.h"
#import "JMChatDefine.h"

@implementation JMCollectionLayout
- (instancetype)init {
    self = [super init];
    if (self) {
     
       
    }
    return self;
}

-(void)prepareLayout{
    
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    
    _cellCount = [self.collectionView numberOfItemsInSection:0]; // cell个数，直接从collectionView中获得
    _insert = 10; // 设置间距
    _itemWidth = screen_size_width / 2 - 3 * _insert; // cell宽度
    

}

-(CGSize)collectionViewContentSize{

    
    return CGSizeMake(screen_size_width, MAX(_leftY, _rightY));
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{

    _leftY = _insert; // 左边起始Y轴
    _rightY = _insert; // 右边起始Y轴
    
    NSMutableArray *attributes = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.cellCount; i ++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    
    return attributes;

}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{

    // 获取代理中返回的每一个cell的大小
    CGSize itemSize = [self.layoutDelegate collectionView:self.collectionView collectionViewLayout:self sizeOfItemAtIndexPath:indexPath];
    
    // 防止代理中给的size.width大于(或小于)layout中定义的width，所以等比例缩放size
    CGFloat itemHeight = floorf(itemSize.height * self.itemWidth / itemSize.width);
    
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    /*
    // 判断当前的item应该在左侧还是右侧
    BOOL isLeft = _leftY < _rightY;
    
    if (isLeft) {
        
        CGFloat x = _insert; // x轴起始位置为0
        attributes.frame = CGRectMake(x, _leftY, _itemWidth, itemHeight);
        _leftY += itemHeight + _insert; // 设置新的Y起点
    }
    
    if (!isLeft) {
        
        CGFloat x = _itemWidth + 2 * _insert;
        attributes.frame = CGRectMake(x, _rightY, _itemWidth, itemHeight);
        _rightY += itemHeight + _insert;
    }*/
    
    return attributes;
    
}



@end
