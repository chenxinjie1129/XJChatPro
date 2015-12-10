//
//  DemoUserXibViewController.m
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/26.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "DemoUserXibViewController.h"

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
    
    model.strUserImage = @"da";
    
    model.strName = @"大哥";
    
    model.strDate = @"日期未知";
    
    model.strContent =textField.text;
    
    
    
    return model;
    
}



-(void)addBtnAction{

    NSLog(@"大哥，看我");
    
    JMChatModel *model = [[JMChatModel alloc] init];
    
    int rand = random()%2;
    
    model.chatType = rand;
    
    model.contentType = JMCONTENT;
    
    model.strUserImage = @"da";
    
    model.strName = @"大哥";
    
    model.strDate = @"日期未知";
    
    model.strContent =@"add normal action";
    
    
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
