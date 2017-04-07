//
//  SpeechController.h
//  iMessage_AVF
//
//  Created by Nigel Lee on 26/03/2017.
//  Copyright © 2017 Apress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SpeechController : NSObject

@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@property (strong, nonatomic) NSArray *voices;
@property (strong, nonatomic) NSArray *speechStrings;

+ (instancetype)speechController;
- (void)beginConversation;

@end
