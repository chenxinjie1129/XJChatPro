//
//  DemoViewController.m
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/26.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    [self testData];
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
