//
// Created by falling on 15/5/22.
// Copyright (c) 2015 codefalling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>


@interface UITimeField : UIView <UIInputViewAudioFeedback,UITextInputTraits,UIKeyInput>

@property (assign) NSString *hourUnit;
@property (assign) NSString *minuteUnit;
@property (assign) NSString *secondUnit;

@property (assign) NSInteger hour;
@property (assign) NSInteger minute;
@property (assign) NSInteger second;


@property (nonatomic, readwrite) UIView *inputAccessoryView;

- (void) refresh;
@end
