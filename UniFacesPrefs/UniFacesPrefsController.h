//
//  UniFacesPrefsController.h
//  UniFacesPrefs
//
//  Created by seatanners on 1/29/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Preferences.h"
#import "TableController.h"
#import "PSSpecifier.h"
#import "PSListController.h"


@interface UniFacesPrefsController : PSListController {
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
