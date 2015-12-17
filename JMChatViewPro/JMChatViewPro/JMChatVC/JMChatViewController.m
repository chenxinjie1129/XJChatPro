//
//  JMChatViewController.m
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "JMChatViewController.h"
#import "JMChatModel.h"
#import "JMChatDefine.h"
#import "JMFunction.h"


@interface JMChatViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITextFieldDelegate>{

}




@property (nonatomic,assign) CGFloat customheaderSizeWith;

@end
   

@implementation JMChatViewController

#define testDataArray @[@"岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫",@"隔壁是国术馆一句惹毛我的人有危险 一再重演一根我不抽的烟 一放好多年",@"店里面的妈妈桑",@" 茶道 有三段",@"教拳脚武术的老板",@" 练铁沙掌 耍杨家枪隔壁是国术馆一句惹毛我的人有危险 一再重演一根我不抽的烟 一放好多年隔壁是国术馆一句惹毛我的人有危险 一再重演一根我不抽的烟 一放好多年隔壁是国术馆一句惹毛我的人有危险 一再重演一根我不抽的烟 一放好多年",@"硬底子功夫最擅长",@"他们儿子我习惯 从小就耳濡目染",@"什么刀枪跟棍棒",@"      我       耍我       耍    的 有   模有样",@"什么兵器 最喜欢 ",@"双截棍柔中带刚",@"想要去河南嵩山学少林跟武当",@"干什么（客）",@"干什么（客）",@"呼吸吐纳心自在",@"干什么（客） 干什么（客）",@"气沉丹田手心开",@"干什么（客）",@" 干什么（客）",@"日行千里系沙袋",@"飞檐走壁莫奇怪 去去就来",@"一个马步向前 ",@"一记 左钩拳右钩拳"]

#define testImageArray @[@"test",@"test1"]

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.chatCollectionView.delegate = self;
    
    self.chatCollectionView.dataSource = self;
    
    self.collectionFactory = [[JMCellFactory alloc] init];
    
    [self.collectionFactory registerCollectionViewCell:self.chatCollectionView];
    
    XJCustomLayout *layout = [[XJCustomLayout alloc] init];
    
    self.layout = layout;
    
    self.chatCollectionView.collectionViewLayout = self.layout;
    
    self.hasUserImage = YES;
    
    self.customheaderSizeWith = headerSizeWith;
    
    self.sendTextField.delegate =self;
    
    [self.addSearchBtn addTarget:self action:@selector(addBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self testData];
    
}


-(void)addBtnAction{
    
    
}

-(void)setHasUserImage:(BOOL)hasUserImage{

    _hasUserImage = hasUserImage;
    
    if (self.hasUserImage) {
        
        self.customheaderSizeWith = headerSizeWith;
    }else{
        
        self.customheaderSizeWith = 0.0;
    }
    
    [self.chatCollectionView reloadData];


}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    [self hideKeyBoard];

}


-(void)showKeyBoard{

    
    self.bottomConstraint.constant = 257;
    //   这里添加方法
    
    [UIView animateWithDuration:0.5f animations:^{
        
        
    } completion:^(BOOL finished) {
        
        
        
    }];
    

}

-(void)hideKeyBoard{

    if (self.bottomConstraint.constant > 0) {
        
        self.bottomConstraint.constant = 0;
        //   这里添加方法
        
        [UIView animateWithDuration:0.5f animations:^{
            
            
        } completion:^(BOOL finished) {
            
            [self.chatCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:self.dataArray.count-1] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
            
            [self.sendTextField resignFirstResponder];
            
            
        }];
        
    }
    
    

    
    

}

-(void)textFieldDidBeginEditing:(UITextField *)textField{

    [self showKeyBoard];
 
}

-(JMChatModel *)sendMsg:(UITextField *)textField{
    
    
    JMChatModel *model = [[JMChatModel alloc] init];
    
    
    model.chatType = CHAT_TO;
    
    model.contentType = JMCONTENT;
    
    model.strContent =textField.text;
    
    return model;
    
    

}

-(void)addMsgNormalAction:(JMChatModel *)model{

    [self.dataArray addObject:model];
    
    [self.chatCollectionView insertSections:[NSIndexSet indexSetWithIndex:self.dataArray.count -1]];
    
    
    [self.chatCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:self.dataArray.count-1] atScrollPosition:UICollectionViewScrollPositionBottom animated:YES];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    NSLog(@"textFieldShouldReturn %@",self.sendTextField.text);
 
 
    JMChatModel *model = [self sendMsg:textField];
    
    [self.dataArray addObject:model];

    [self.chatCollectionView insertSections:[NSIndexSet indexSetWithIndex:self.dataArray.count -1]];

   
    
    textField.text = @"";
    
    
    [self hideKeyBoard];
    
    return YES;
    
}

-(void)testData{

    for (int i = 0; i<2; i++) {
        
        JMChatModel *model = [[JMChatModel alloc] init];

        int value = arc4random()%2;
        
        model.chatType = value;
        
        model.strName =@"陈大哥";
        
        model.strUserImage = @"test";
        
        model.strDate = @"日期未知";
        
        if (value == 0) {
    
            model.contentType = JMCONTENT;
            
            model.strContent = [testDataArray objectAtIndex:i];
            
        }else{
            
            int testImageIndex = arc4random()%2;
            
        
            model.contentType = JMIMAGE;

            model.cellSize =  CGSizeMake(150 , 200);
            
            model.strURLImage = [testImageArray objectAtIndex:testImageIndex];
            
        
        }
        
        [self.dataArray addObject:model];
       
        
        
    }
    
    [self.chatCollectionView reloadData];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - collection View

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return self.dataArray.count;


}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 3;


}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 1.0f;

}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 1.0F;

}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    JMChatModel *model = [self.dataArray objectAtIndex:section];
    
    CGFloat withE;
    
    if (model.contentType == JMCONTENT) {
        
        withE =screen_size_width - model.width -10 - 2*self.customheaderSizeWith;
        
    }else{
    
        withE = screen_size_width - 150 - 10 - 2*self.customheaderSizeWith;
    
    }
   
    
    if (model.chatType == CHAT_FROM) {
    
        return UIEdgeInsetsMake(0, withE, 5, 0);
    
    
    }else{
        
        return UIEdgeInsetsMake(0, 0, 5, withE);
        
    
    }

}




-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(screen_size_width, 30);


}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    JMChatModel *model = [self.dataArray objectAtIndex:indexPath.section];
    
    return [self.collectionFactory setupHeader:collectionView andIndexPath:indexPath withModel:model];


}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JMChatModel *model = [self.dataArray objectAtIndex:indexPath.section];
    
    if (indexPath.item == 0 || indexPath.item == 2) {
        
        if (!self.hasUserImage) {
            
            return CGSizeMake(0, 0);
            
            
        }
        
        return CGSizeMake(self.customheaderSizeWith, self.customheaderSizeWith +20);
        
    }else{
        
        return model.cellSize;
       
    
    }



}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JMChatModel *model = [self.dataArray objectAtIndex:indexPath.section];
  
    
    if (indexPath.item == 0 || indexPath.item == 2) {
       
        UICollectionViewCell *cell = [self.collectionFactory setupHeader:collectionView cellForItemAtIndexPath:indexPath WithModel:model];
        
        if (!self.hasUserImage) {
            
            [cell removeConstraints:cell.constraints];
        }
        
        return cell;
    }else{
        
       
        return [self.collectionFactory setupCollectionForCell:collectionView cellForItemAtIndexPath:indexPath WithModel:model];

    }

   
    

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    JMChatModel *model = [self.dataArray objectAtIndex:indexPath.section];
  
    if (indexPath.item == 0 || indexPath.item == 2 ) {
        
        [self selectHeader:model];
        
    }else{
    
        [self selectContent:model];
    
    }
    
    
    


}
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark - lazyload

-(NSMutableArray *)dataArray{

    if (!_dataArray) {
        
        _dataArray = [NSMutableArray array];
    }
    

    return _dataArray;

}


#pragma mark -

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
