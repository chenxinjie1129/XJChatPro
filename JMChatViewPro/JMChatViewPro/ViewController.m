//
//  ViewController.m
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "ViewController.h"
#import "DemoViewController.h"
#import "DemoUserXibViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showAction:(id)sender {
        DemoViewController *chatVC = [[DemoViewController alloc] initWithNibName:@"JMChatViewController" bundle:nil];
    
    [self.navigationController pushViewController:chatVC animated:YES];
}
- (IBAction)showWithXib:(id)sender {
    
    DemoUserXibViewController *userXib = [[DemoUserXibViewController alloc] init];
    
    [self.navigationController pushViewController:userXib animated:YES];
}

@end
