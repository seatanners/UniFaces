//
//  Preferences.h
//  UniFaces
//
//  Created by seatanners on 1/30/14.
//
//

#import <Foundation/Foundation.h>

#define PREFS_LOCATION "/var/mobile/Library/Preferences/org.seatanners.UniFacesPrefs.plist"
#define PREFS_KEY_FACES "faces"

@interface Preferences : NSObject

@property (strong, nonatomic) NSDictionary* dictionary;

-(id)init;
-(void)save;
-(void)reset;

@end
