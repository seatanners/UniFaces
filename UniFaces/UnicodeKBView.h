//
//  UnicodeKBView.h
//  UniFaces
//
//  Created by seatanners on 1/20/14.
//  Copyright (c) 2014. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ButtonPressListener.h"
#import "Preferences.h"

@interface UnicodeKBView : UIView<ButtonPressListener>
- (id)initWithFrame:(CGRect)frame withButtonPressListener:(id<ButtonPressListener>)receiver;
@end
