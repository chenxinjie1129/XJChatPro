//
//  DemoUserXibViewController.m
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/26.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "DemoUserXibViewController.h"
#import "XJCustomLayout.h"

#define testDataArray @[@"岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫岩烧店的烟味弥漫",@"隔壁是国术馆一句惹毛我的人有危险 一再重演一根我不抽的烟 一放好多年",@"店里面的妈妈桑",@" 茶道 有三段",@"教拳脚武术的老板",@" 练铁沙掌 耍杨家枪隔壁是国术馆一句惹毛我的人有危险 一再重演一根我不抽的烟 一放好多年隔壁是国术馆一句惹毛我的人有危险 一再重演一根我不抽的烟 一放好多年隔壁是国术馆一句惹毛我的人有危险 一再重演一根我不抽的烟 一放好多年",@"硬底子功夫最擅长",@"他们儿子我习惯 从小就耳濡目染",@"什么刀枪跟棍棒",@"      我       耍我       耍    的 有   模有样",@"什么兵器 最喜欢 ",@"双截棍柔中带刚",@"想要去河南嵩山学少林跟武当",@"干什么（客）",@"干什么（客）",@"呼吸吐纳心自在",@"干什么（客） 干什么（客）",@"气沉丹田手心开",@"干什么（客）",@" 干什么（客）",@"日行千里系沙袋",@"飞檐走壁莫奇怪 去去就来",@"一个马步向前 ",@"一记 左钩拳右钩拳"]

@interface DemoUserXibViewController ()

@end

@implementation DemoUserXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
  //s  [self testData];
}


-(JMChatModel *)sendMsg:(UITextField *)textField{
    
    JMChatModel *model = [[JMChatModel alloc] init];
    
    
    model.chatType = CHAT_FROM;
    
    model.contentType = JMCONTENT;
    
    model.strUserImage = @"test";
    
    model.strName = @"大哥";
    
    model.strDate = @"日期未知";
    
    model.strContent =textField.text;
    
    
    
    return model;
    
}



-(void)addBtnAction{

    
    JMChatModel *model = [[JMChatModel alloc] init];
    
    int contentIndex = random()%10;
    
    int rand = random()%2;
    
    model.chatType = rand;
    
    model.contentType = JMCONTENT;
    
    model.strUserImage = @"test";
    
    model.strName = @"大哥";
    
    model.strDate = @"日期未知";
    
    model.strContent = testDataArray[contentIndex];
    
    ((XJCustomLayout *)self.chatCollectionView.collectionViewLayout).isInset = YES;
    
    [self addMsgNormalAction:model];
    

}


-(void)selectHeader:(JMChatModel *)model{
    
    NSLog(@"click %@",model.strName);
    
    
}

-(void)selectContent:(JMChatModel *)model{
    
    NSLog(@"click %@",model.strContent);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
