//
//  BubbleCell.m
//  iMessage_AVF
//
//  Created by Nigel Lee on 26/03/2017.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "BubbleCell.h"


@implementation BubbleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        
        self.selectionStyle = UITableViewCellSeparatorStyleSingleLine;
        
        [self.contentView addSubview:self.messageLabel];
        //self.background = [self backgroundWithType:[reuseIdentifier isEqualToString:@"YouCell"]];
        _background = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.frame.origin.x + 68, self.contentView.frame.origin.y + 2, 307, 56)];
        //NSString *name =  @"bubble_right" : @"bubble_left";
        _background.image = [UIImage imageNamed:@"bubble_right"];
        _background.contentMode = UIViewContentModeScaleToFill;
        
        [self.contentView addSubview:_background];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark-- Properties
- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentView.frame.size.height/2, 375, 44)];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.textColor = [UIColor blackColor];
        _messageLabel.font = [UIFont systemFontOfSize:17.f];
        _messageLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _messageLabel;
}

/*
- (UIImageView *)backgroundWithType:(BOOL)isMyCell
{
    if (!_background) {
        _background = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.frame.origin.x + 68, self.contentView.frame.origin.y + 2, 307, 56)];
        NSString *name = (isMyCell) ? @"bubble_right" : @"bubble_left";
        _background.image = [UIImage imageNamed:name];
        _background.contentMode = UIViewContentModeScaleToFill;
    }
    return _background;
    
}
 */






@end
