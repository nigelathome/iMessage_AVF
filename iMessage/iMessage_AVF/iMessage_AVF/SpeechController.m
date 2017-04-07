//
//  SpeechController.m
//  iMessage_AVF
//
//  Created by Nigel Lee on 26/03/2017.
//  Copyright © 2017 Apress. All rights reserved.
//

/*
 ar-SA  沙特阿拉伯（阿拉伯文）
 
 en-ZA, 南非（英文）
 
 nl-BE, 比利时（荷兰文）
 
 en-AU, 澳大利亚（英文）
 
 th-TH, 泰国（泰文）
 
 de-DE, 德国（德文）
 
 en-US, 美国（英文）
 
 pt-BR, 巴西（葡萄牙文）
 
 pl-PL, 波兰（波兰文）
 
 en-IE, 爱尔兰（英文）
 
 el-GR, 希腊（希腊文）
 
 id-ID, 印度尼西亚（印度尼西亚文）

 sv-SE, 瑞典（瑞典文）
 
 tr-TR, 土耳其（土耳其文）
 
 pt-PT, 葡萄牙（葡萄牙文）
 
 ja-JP, 日本（日文）
 
 ko-KR, 南朝鲜（朝鲜文）
 
 hu-HU, 匈牙利（匈牙利文）
 
 cs-CZ, 捷克共和国（捷克文）
 
 da-DK, 丹麦（丹麦文）
 
 es-MX, 墨西哥（西班牙文）
 
 fr-CA, 加拿大（法文）
 
 nl-NL, 荷兰（荷兰文）
 
 fi-FI, 芬兰（芬兰文）
 
 es-ES, 西班牙（西班牙文）
 
 it-IT, 意大利（意大利文）
 
 he-IL, 以色列（希伯莱文，阿拉伯文）
 
 no-NO, 挪威（挪威文）
 
 ro-RO, 罗马尼亚（罗马尼亚文）
 
 zh-HK, 香港（中文）
 
 zh-TW, 台湾（中文）
 
 sk-SK, 斯洛伐克（斯洛伐克文）
 
 zh-CN, 中国（中文）
 
 ru-RU, 俄罗斯（俄文）
 
 en-GB, 英国（英文）
 
 fr-FR, 法国（法文）
 
 hi-IN  印度（印度文）
 */


#import "SpeechController.h"

@implementation SpeechController

+ (instancetype)speechController
{
    return [[self alloc] init];
}

- (id)init
{
    self = [super init];
    if (self) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
        
        _voices = @[[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"],
                    [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-HK"]];
        
        _speechStrings = [self buildSpeechStrings];
    }
    return self;
}

- (NSArray *)buildSpeechStrings
{
    return @[@"居居居居，你好吗?",
             @"不好不好我不好",
             @"居居居居，吃饭饭?",
             @"你食饭咗咩啊 不吃不吃我不吃",
             @"What's your favorite feature?",
             @"Oh, they're all my babies.  I couldn't possibly choose.",
             @"It was great to speak with you!",
             @"The pleasure was all mine!  Have fun!"];
}

- (void)beginConversation
{
    for (NSUInteger i = 0; i < self.speechStrings.count; i++) {
        AVSpeechUtterance *utterance =
        [[AVSpeechUtterance alloc] initWithString:self.speechStrings[i]];
        utterance.voice = self.voices[i % 2];
        utterance.rate = 0.5f;
        utterance.pitchMultiplier = 0.8f;
        utterance.postUtteranceDelay = 0.1f;
        [self.synthesizer speakUtterance:utterance];
    }
}

@end
