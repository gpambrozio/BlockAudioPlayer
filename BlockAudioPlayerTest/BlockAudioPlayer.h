//
//  BlockAudioPlayer.h
//  BlockAudioPlayerTest
//
//  Created by Gustavo Ambrozio on 18/8/12.
//  Copyright (c) 2012 Gustavo Ambrozio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "ARCHelper.h"

typedef void (^AudioPlayerDidFinishPlayingBlock)(BOOL);
typedef void (^AudioPlayerDecodeErrorDidOccurBlock)(NSError *);
typedef void (^AudioPlayerBeginInterruptionBlock)();
typedef void (^AudioPlayerEndInterruptionBlock)(NSUInteger);

@interface BlockAudioPlayer : AVAudioPlayer <AVAudioPlayerDelegate>

@property (nonatomic, copy) AudioPlayerDidFinishPlayingBlock audioPlayerDidFinishPlayingBlock;
@property (nonatomic, copy) AudioPlayerDecodeErrorDidOccurBlock audioPlayerDecodeErrorDidOccurBlock;
@property (nonatomic, copy) AudioPlayerBeginInterruptionBlock audioPlayerBeginInterruptionBlock;
@property (nonatomic, copy) AudioPlayerEndInterruptionBlock audioPlayerEndInterruptionBlock;

@end
