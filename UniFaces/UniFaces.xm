#include "UIKBTree.h"
#include "UIKeyboardLayoutStar.h"
#include "UIKeyboardImpl.h"
#include "UnicodeKBView.h"
#include "ButtonPressListener.h"
#include "ButtonPressHandler.h"

%hook UIKeyboardImpl

- (void)longPressAction {
    UIKeyboardLayoutStar *layoutStar = (UIKeyboardLayoutStar *) [self _layout];
    UIKBTree *activeKey = layoutStar.activeKey;
    NSString *name = [activeKey name];
    if([name isEqualToString:@"Space-Key"]) {
        for(UIView *view in self.subviews) {
            if([view isKindOfClass:[UnicodeKBView class]]) {
                [view removeFromSuperview];
                break;
            }
        }
        
        ButtonPressHandler *handler = [[ButtonPressHandler alloc] initWithKeyboard:self];
        UnicodeKBView *view = [[UnicodeKBView alloc] initWithFrame:self.frame withButtonPressListener:handler];
        [self addSubview:view];
        [layoutStar deactivateActiveKeys];
    }
    return %orig;
}

- (NSArray *)subviews {
    for(UIView *view in %orig) {
        if([view isKindOfClass:[UnicodeKBView class]]) {
            [self bringSubviewToFront:view];
            break;
        }
    }
    return %orig;
}

%end
