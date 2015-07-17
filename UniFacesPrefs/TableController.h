//
//  TableController.h
//  UniFaces
//
//  Created by seatanners on 1/30/14.
//
//

#import <UIKit/UIKit.h>
#import "Preferences.h"

@interface TableController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
- initWithPreferences:(Preferences *)p andTableView:(UITableView*)tableView;
@end
