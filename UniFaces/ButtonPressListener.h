//
//  ButtonPressListener.h
//  UniFaces
//
//  Created by seatanners on 1/20/14.
//  Copyright (c) 2014. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ButtonPressListener
- (void)buttonPressReceived:(UIButton *)src;
@end
