//
// Created by falling on 15/5/22.
// Copyright (c) 2015 codefalling. All rights reserved.
//

#import "UITimeField.h"
#define INPUT_STACK_SIZE  6

@implementation UITimeField {

enum LABEL_TYPE{
    LABEL_HOUR=0,
    LABEL_HOUR_UNIT,
    LABEL_MINUTE,
    LABEL_MINUTE_UNIT,
    LABEL_SECOND,
    LABEL_SECOND_UNIT,
    SIZE_GUARD  // A guard
};
@private
    __unsafe_unretained NSString *_hourUnit;
    __unsafe_unretained NSString *_minuteUnit;
    __unsafe_unretained NSString *_secondUnit;
    NSInteger _hour;
    NSInteger _minute;
    NSInteger _second;
    UILabel *_labels[SIZE_GUARD];
    NSInteger _inputStack[INPUT_STACK_SIZE];
    NSInteger _stackPos;
}

@synthesize hourUnit = _hourUnit;
@synthesize minuteUnit = _minuteUnit;
@synthesize secondUnit = _secondUnit;
@synthesize hour = _hour;
@synthesize minute = _minute;
@synthesize second = _second;

- (BOOL)enableInputClicksWhenVisible {
    return YES;
}

- (void)initField{
    _hourUnit = @"H";
    _minuteUnit = @"M";
    _secondUnit = @"S";
    _hour = 0;
    _second = 0;
    _minute = 0;
    for(NSInteger i=0;i<SIZE_GUARD;i++){
        _labels[i] = [[UILabel alloc] init];
    }
    _stackPos = 0;
    [self refresh];

}


- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initField];
    }

    return self;
}

- (NSInteger)fontSizeFitHeight:(CGFloat)height {
    float fontSize = 4;
    UILabel *label = [[UILabel alloc] initWithFrame:self.frame];
    label.text = @"S";
    while ([label.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}].height < height -4)
    {
        fontSize+=1;
    }
    return fontSize;
}



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        [self initField];
    }

    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    CGFloat timeWidth = self.frame.size.width / 3 /4 *3;
    CGFloat unitWidth = self.frame.size.width / 3 /4;
    CGFloat timeHeight = self.frame.size.height;
    CGFloat unitHeight = self.frame.size.height / 4;
    CGFloat unitY = unitHeight*1.7;

    for(NSInteger i=0;i<SIZE_GUARD;i++){

        CGFloat x=0,y=0;
        for(NSInteger k=0;k<i;k++){
            if(k== LABEL_HOUR||k==LABEL_MINUTE||k==LABEL_SECOND){
                x += timeWidth;
            }else{
                x += unitWidth;
            }
        }

        if(i==LABEL_HOUR||i==LABEL_SECOND||i==LABEL_MINUTE){
            _labels[i].frame = CGRectMake(x,0,timeWidth,timeHeight);
            _labels[i].font = [UIFont systemFontOfSize:[self fontSizeFitHeight:timeWidth]];
        }else{
            _labels[i].frame = CGRectMake(x, unitY, unitWidth, unitHeight);
            _labels[i].font = [UIFont systemFontOfSize:[self fontSizeFitHeight:unitWidth]];
        }

        [self refresh];
        [self addSubview:_labels[i]];
    }

}

- (NSString*) getTimeAsStr:(NSInteger) time{
    NSString *zero = @"0";
    return (time>10)?@(time).stringValue:([zero stringByAppendingString:@(time).stringValue]);
}

- (void)refresh {

    switch (_stackPos){
        case 0:
            _hour = 0;
            _minute = 0;
            _second = 0;
            break;
        case 1:
            _hour = 0;
            _minute = 0;
            _second = _inputStack[0];
            break;
        case 2:
            _hour = 0;
            _minute = 0;
            _second = _inputStack[0]*10+_inputStack[1];
            break;
        case 3:
            _hour = 0;
            _minute = _inputStack[0];
            _second = _inputStack[1]*10+_inputStack[2];
            break;
        case 4:
            _hour = 0;
            _minute = _inputStack[0]*10+_inputStack[1];
            _second = _inputStack[2]*10+_inputStack[3];
            break;
        case 5:
            _hour = _inputStack[0];
            _minute = _inputStack[1]*10+_inputStack[2];
            _second = _inputStack[3]*10+_inputStack[4];
            break;
        case 6:
            _hour = _inputStack[0]*10+_inputStack[1];
            _minute = _inputStack[2]*10+_inputStack[3];
            _second = _inputStack[4]*10+_inputStack[5];
            break;
    }
    for(NSInteger i =0;i<SIZE_GUARD;i++) {
        _labels[i].text = (i == LABEL_HOUR) ? [self getTimeAsStr:_hour] :
                (i == LABEL_HOUR_UNIT) ? _hourUnit :
                (i == LABEL_MINUTE) ?[self getTimeAsStr:_minute]  :
                (i == LABEL_MINUTE_UNIT) ? _minuteUnit :
                (i == LABEL_SECOND) ? [self getTimeAsStr:_second]  :
                (i == LABEL_SECOND_UNIT) ? _secondUnit : @"BAD";
    }

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self becomeFirstResponder];

}


- (BOOL)canBecomeFirstResponder
{
    return YES;
}


 - (void)deleteBackward
{
    if(_stackPos>0){
        _stackPos--;
    }
    [self refresh];
}

 - (void)insertText:(NSString *)text
{
    if(_stackPos< INPUT_STACK_SIZE){
        _inputStack[_stackPos] = [text intValue];
        _stackPos++;
    }
    [self refresh];
}

 - (BOOL)hasText
{
    return NO;
}


- (UIKeyboardType) keyboardType
{
    return UIKeyboardTypeNumberPad;
}


@end