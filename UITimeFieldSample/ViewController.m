//
//  ViewController.m
//  UITimeFieldSample
//
//  Created by falling on 15/5/22.
//  Copyright (c) 2015 codefalling. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
UITimeField *_timeField;


- (void)viewDidLoad {
    [super viewDidLoad];

    _timeField = [[UITimeField alloc] initWithFrame:CGRectMake(20, 20, 240, 230)];
    _timeField.hourUnit=@"h";
    _timeField.minuteUnit=@"m";
    _timeField.secondUnit=@"s";

    [_timeField setInput:@"233232"];
    [self.view addSubview:_timeField];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];


    [btn setTitle:@"Show second" forState:UIControlStateNormal];
    btn.frame = CGRectMake(self.view.frame.size.width/3,self.view.frame.size.height/3, 130, 60);
    [btn addTarget:self
                   action:@selector(methodTouchDown)
         forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)methodTouchDown{
    NSString *msg = [[NSString alloc] initWithFormat:@"Get %d second",_timeField.hour*60*60+_timeField.minute*60+_timeField.second];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"OK"
                                                    message:msg
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end