//
//  Preferences.m
//  UniFaces
//
//  Created by seatanners on 1/30/14.
//
//

#import "Preferences.h"

@implementation Preferences

- (id)init {
    self = [super init];
    if (self) {
        if (!(self.dictionary = [[NSDictionary alloc] initWithContentsOfFile:@PREFS_LOCATION])) {
            [self reset];
        }
    }
    return self;
}

- (void)save {
    [self.dictionary writeToFile:@PREFS_LOCATION atomically:YES];
}

- (void)reset {
    self.dictionary = [[NSMutableDictionary alloc] init];
    [self.dictionary setValue:[Preferences defaultFaces] forKey:@PREFS_KEY_FACES];
    [self save];
}

+ (NSArray*)defaultFaces {
    return @[@"¯\\_(ツ)_/¯", @"ಠ_ಠ", @"ಠ‿ಠ", @"ಠ╭╮ಠ", @"◉_◉", @"( ◕ ◡ ◕ )", @"(╯°□°）╯︵ ┻━┻", @"┬─┬ノ( º _ ºノ)", @"( ͡° ͜ʖ ͡°)", @"ʕ•ᴥ•ʔ", @"(ಥ_ಥ)", @"(☞ﾟヮﾟ)☞ ", @"(ᵔᴥᵔ)", @"[̲̅$̲̅(̲̅5̲̅)̲̅$̲̅]", @"(⌐■_■)", @"╭∩╮(-_-)╭∩╮",  @"ヽ༼ຈل͜ຈ༽ﾉ", @"(´･ω･`)"];
}

@end
