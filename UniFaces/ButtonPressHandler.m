//
//  ButtonPressHandler.m
//  UniFaces
//
//  Created by seatanners on 1/20/14.
//  Copyright (c) 2014. All rights reserved.
//

#import "ButtonPressHandler.h"

@implementation ButtonPressHandler

- (id)initWithKeyboard:(UIKeyboardImpl*)keyboard {
    self = [super init];
    if(self) {
        self.keyboardImplRef = keyboard;
    }
    return self;
}

- (void)buttonPressReceived:(UIButton *)src {
    [self.keyboardImplRef insertText:src.currentTitle];
}

@end
