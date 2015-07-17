//
//  UIKeyboardImpl.h
//  UniFaces
//
//  Created by seatanners on 1/17/14.
//  Copyright (c) 2014. All rights reserved.
//

#ifndef UniFaces_UIKeyboardImpl_h
#define UniFaces_UIKeyboardImpl_h

#import <UIKit/UIKit.h>

@interface UIKeyboardImpl : UIView
- (void)insertText:(id)text;
- (CGRect)frame;
- (id)_layout;
- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg;
- (NSArray *)subviews;
@end

#endif
