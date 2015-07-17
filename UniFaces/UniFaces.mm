#line 1 "/Users/Tanner/Developer/iPhone/UniFaces/UniFaces/UniFaces.xm"
#include "UIKBTree.h"
#include "UIKeyboardLayoutStar.h"
#include "UIKeyboardImpl.h"
#include "UnicodeKBView.h"
#include "ButtonPressListener.h"
#include "ButtonPressHandler.h"

#include <logos/logos.h>
#include <substrate.h>
@class UIKeyboardImpl; 
static void (*_logos_orig$_ungrouped$UIKeyboardImpl$longPressAction)(UIKeyboardImpl*, SEL); static void _logos_method$_ungrouped$UIKeyboardImpl$longPressAction(UIKeyboardImpl*, SEL); static NSArray * (*_logos_orig$_ungrouped$UIKeyboardImpl$subviews)(UIKeyboardImpl*, SEL); static NSArray * _logos_method$_ungrouped$UIKeyboardImpl$subviews(UIKeyboardImpl*, SEL); 

#line 8 "/Users/Tanner/Developer/iPhone/UniFaces/UniFaces/UniFaces.xm"


static void _logos_method$_ungrouped$UIKeyboardImpl$longPressAction(UIKeyboardImpl* self, SEL _cmd) {
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
    return _logos_orig$_ungrouped$UIKeyboardImpl$longPressAction(self, _cmd);
}

static NSArray * _logos_method$_ungrouped$UIKeyboardImpl$subviews(UIKeyboardImpl* self, SEL _cmd) {
    for(UIView *view in _logos_orig$_ungrouped$UIKeyboardImpl$subviews(self, _cmd)) {
        if([view isKindOfClass:[UnicodeKBView class]]) {
            [self bringSubviewToFront:view];
            break;
        }
    }
    return _logos_orig$_ungrouped$UIKeyboardImpl$subviews(self, _cmd);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIKeyboardImpl = objc_getClass("UIKeyboardImpl"); MSHookMessageEx(_logos_class$_ungrouped$UIKeyboardImpl, @selector(longPressAction), (IMP)&_logos_method$_ungrouped$UIKeyboardImpl$longPressAction, (IMP*)&_logos_orig$_ungrouped$UIKeyboardImpl$longPressAction);MSHookMessageEx(_logos_class$_ungrouped$UIKeyboardImpl, @selector(subviews), (IMP)&_logos_method$_ungrouped$UIKeyboardImpl$subviews, (IMP*)&_logos_orig$_ungrouped$UIKeyboardImpl$subviews);} }
#line 41 "/Users/Tanner/Developer/iPhone/UniFaces/UniFaces/UniFaces.xm"
