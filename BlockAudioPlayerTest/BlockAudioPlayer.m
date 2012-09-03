//
//  BlockAudioPlayer.m
//  BlockAudioPlayerTest
//
//  Created by Gustavo Ambrozio on 18/8/12.
//  Copyright (c) 2012 Gustavo Ambrozio. All rights reserved.
//

#import "BlockAudioPlayer.h"

@implementation BlockAudioPlayer

@synthesize audioPlayerDidFinishPlayingBlock;
@synthesize audioPlayerDecodeErrorDidOccurBlock;
@synthesize audioPlayerBeginInterruptionBlock;
@synthesize audioPlayerEndInterruptionBlock;

- (void)dealloc
{
    [audioPlayerDidFinishPlayingBlock release];
    [audioPlayerDecodeErrorDidOccurBlock release];
    [audioPlayerBeginInterruptionBlock release];
    [audioPlayerEndInterruptionBlock release];
    [super ah_dealloc];
}

- (id)initWithContentsOfURL:(NSURL *)url error:(NSError **)outError
{
    self = [super initWithContentsOfURL:url error:outError];
    if (self)
    {
        self.delegate = self;
    }
    
    return self;
}

- (id)initWithData:(NSData *)data error:(NSError **)outError
{
    self = [super initWithData:data error:outError];
    if (self)
    {
        self.delegate = self;
    }
    return self;
}


#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (audioPlayerDidFinishPlayingBlock)
        audioPlayerDidFinishPlayingBlock(flag);
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    if (audioPlayerDecodeErrorDidOccurBlock)
        audioPlayerDecodeErrorDidOccurBlock(error);
}

- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
    if (audioPlayerBeginInterruptionBlock)
        audioPlayerBeginInterruptionBlock();
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withFlags:(NSUInteger)flags
{
    if (audioPlayerEndInterruptionBlock)
        audioPlayerEndInterruptionBlock(flags);
}

@end
