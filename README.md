[![GitHub license](https://img.shields.io/github/license/mashape/apistatus.svg)]()
[![platform](https://img.shields.io/badge/platform-iOS-blue.svg)]()

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

## Pod

Comming soon

# How to use

```objective-c
UITimeField *_timeField = [[UITimeField alloc] initWithFrame:CGRectMake(20, 20, 260, 160)];
_timeField.hourUnit=@"h";
_timeField.minuteUnit=@"m";
_timeField.secondUnit=@"s";
[self.view addSubview:_timeField];
```

Or add Custom View with `UITimeField` in your storyboard.

- You can use `_timeField.hour`,`_timeField.minute`,`_timeField.second` to set or get time.

- You can use `refresh` to let it refresh UI data

**Notice** that `hour` bigger than 24 and `minute`/`second` bigger than 60 is **allowed**(Just like android timer's behaviour)
