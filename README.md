[![CocoaPods](https://img.shields.io/cocoapods/v/UITimeField.svg)](https://cocoapods.org/?q=UITimeField)
[![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://raw.githubusercontent.com/CodeFalling/UITimeField/master/LICENSE)
[![platform](https://img.shields.io/badge/platform-iOS-blue.svg)]()
[![Build Status](https://travis-ci.org/CodeFalling/UITimeField.svg?branch=master)](https://travis-ci.org/CodeFalling/UITimeField)

# UITimeField
A iOS time input inspire by Android's timer app

# Preview

![preview](http://i1.tietuku.com/0f6503feaf19afeb.gif)

# Install

## Manual

Copy or use git module to import 

```
├── UITimeField
│   ├── UITimeField.h
│   └── UITimeField.m
```

## CocoaPods

```
platform :ios
pod 'UITimeField','1.1.1'
```

# How to use

```objective-c
#import "UITimeField.h"
```

```objective-c
UITimeField *_timeField = [[UITimeField alloc] initWithFrame:CGRectMake(20, 20, 260, 160)];
_timeField.hourUnit=@"h";
_timeField.minuteUnit=@"m";
_timeField.secondUnit=@"s";
[self.view addSubview:_timeField];
```

Or add Custom View with `UITimeField` in your storyboard.

- You can use `_timeField.hour`,`_timeField.minute`,`_timeField.second` to get time.

- You can use `refresh` to let it refresh UI data

- You can use `setInput:(NSString *)timeStr` to set input string.(**notice that timeStr.length must <= 6)

**Notice** that `hour` bigger than 24 and `minute`/`second` bigger than 60 is **allowed**(Just like android timer's behaviour)
