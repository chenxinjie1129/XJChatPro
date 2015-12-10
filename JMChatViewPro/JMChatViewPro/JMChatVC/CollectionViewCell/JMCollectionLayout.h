//
//  JMCollectionLayout.h
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/27.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JMCollectionLayout;

@protocol  JMCollectionLayout <NSObject>
/*通过代理获得每个cell的高度(之所以用代理取得高度的值，就是为了解耦，这里定义的LFWaterFlowLayout不依赖与任务模型数据)*/
- (CGSize)collectionView:(UICollectionView *)collectionView collectionViewLayout:(JMCollectionLayout *)collectionViewLayout sizeOfItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface JMCollectionLayout : UICollectionViewLayout

@property (assign, nonatomic) CGFloat leftY; // 左侧起始Y轴
@property (assign, nonatomic) CGFloat rightY; // 右侧起始Y轴
@property (assign, nonatomic) NSInteger cellCount; // cell个数
@property (assign, nonatomic) CGFloat itemWidth; // cell宽度
@property (assign, nonatomic) CGFloat insert; // 间距

@property (assign, nonatomic) id layoutDelegate;

@end
