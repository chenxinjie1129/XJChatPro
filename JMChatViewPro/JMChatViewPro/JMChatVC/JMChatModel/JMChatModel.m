//
//  JMChatModel.m
//  JMChatViewPro
//
//  Created by 梁继明 on 15/11/25.
//  Copyright © 2015年 梁继明. All rights reserved.
//

#import "JMChatModel.h"
#import "JMFunction.h"

@implementation JMChatModel

-(void)setStrContent:(NSString *)strContent{

    _strContent = strContent;

    CGFloat width;
    
    CGFloat height;
    
    width = [JMFunction calLabelWidth:[UIFont systemFontOfSize:17.0f] andStr:strContent WithSize:CGSizeMake(MAXFLOAT, 30)];
    

    if (width < screen_size_width - 14 - 2*headerSizeWith) {

        width += 5;
        
    }else{
        
        width = screen_size_width  - 4 - 2*headerSizeWith - 27;
        
        
    }
    
    height = [JMFunction calLabelHeight:[UIFont systemFontOfSize:17.0f] andStr:strContent WithSize:CGSizeMake(width, 2000)];
    
    width +=28;
    
    self.width = width;
    
    self.height = height + 20;
    
    self.cellSize = CGSizeMake(width, height+20);



}

-(void)setNCreateDate:(NSInteger)nCreateDate{

    _nCreateDate = nCreateDate;
    
    self.strDate = [self getTimeWithFormatWith:nCreateDate withFormate:@"mm:DD:hh:ss"];
    


}

-(NSString *)getTimeWithFormatWith:(NSTimeInterval) time withFormate:(NSString *)formate{
    
    NSDate* now = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    //指定输出的格式   这里格式必须是和上面定义字符串的格式相同，否则输出空
    [formatter setDateFormat:formate];
    
    NSString  *newdate=[formatter stringFromDate:now];
    
    return newdate;
    
    
}


@end
