//
//  UIKeyboardLayoutStar.h
//  UniFaces
//
//  Created by seatanners on 1/17/14.
//  Copyright (c) 2014. All rights reserved.
//

#ifndef UniFaces_UIKeyboardLayoutStar_h
#define UniFaces_UIKeyboardLayoutStar_h

@interface UIKeyboardLayoutStar : NSObject
@property(retain, nonatomic) UIKBTree *activeKey;
- (void)deactivateActiveKeys;
@end

#endif
