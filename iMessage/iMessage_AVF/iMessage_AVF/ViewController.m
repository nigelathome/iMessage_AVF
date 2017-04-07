//
//  ViewController.m
//  iMessage_AVF
//
//  Created by Nigel Lee on 26/03/2017.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "ViewController.h"
#import "SpeechController.h"
#import "BubbleCell.h"

@interface ViewController () <AVSpeechSynthesizerDelegate>

@property (nonatomic, strong) NSMutableArray *speechStrings;
@property (nonatomic, strong) SpeechController *speechController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 20.0f, 0.0f);
    self.speechController = [SpeechController speechController];
    self.speechController.synthesizer.delegate = self;
    self.speechStrings = [NSMutableArray array];
    [self.speechController beginConversation];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[BubbleCell class] forCellReuseIdentifier:@"YouCell"];
    [self.tableView registerClass:[BubbleCell class] forCellReuseIdentifier:@"AVFCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.speechStrings.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = indexPath.row % 2 == 0 ? @"YouCell" : @"AVFCell";
    
    BubbleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[BubbleCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:identifier];
    }
    cell.messageLabel.text = self.speechStrings[indexPath.row];
    return cell;
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    [self.speechStrings addObject:utterance.speechString];
    [self.tableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.speechStrings.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}


@end
