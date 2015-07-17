//
//  UniFacesPrefsController.m
//  UniFacesPrefs
//
//  Created by seatanners on 1/29/14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "UniFacesPrefsController.h"

@interface UniFacesPrefsController()
@property (strong, nonatomic) Preferences* prefs;
@property (strong, nonatomic) TableController* tableController;
@end

@implementation UniFacesPrefsController

- (id)specifiers {
    if (_specifiers == nil) {
        _specifiers = [self loadSpecifiersFromPlistName:@"UniFacesPrefs" target:self];
    }
    return _specifiers;
}

-(id)initForContentSize:(CGSize)contentSize {
    self = [super initForContentSize:contentSize];
    if (self) {
        NSArray* views = [self.bundle loadNibNamed:@"PrefView" owner:self options:nil];
        [[self view] addSubview:views[0]];
        
        self.prefs = [[Preferences alloc] init];
        
        self.tableController = [[TableController alloc] initWithPreferences:self.prefs andTableView:self.tableView];
        self.tableView.delegate = self.tableController;
        self.tableView.dataSource = self.tableController;
    }
    return self;
}

- (IBAction)buttonPressed:(UIButton*)sender {
    NSString* text = sender.titleLabel.text;
    if ([text isEqualToString:@"Edit"]) {
        [self.tableView setEditing:!self.tableView.editing animated:YES];
        sender.selected = !sender.selected;
    } else if ([text isEqualToString:@"Add"]) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Enter a new face!" message:@"Type (or copy and paste) a face to add!" delegate:self.tableController cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK!", nil];
        alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
        alertView.tag = 0;
        [alertView show];
    } else if ([text isEqualToString:@"Reset"]) {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Did you mean to do that?" message:@"Are you sure you would like to reset all customization?" delegate:self.tableController cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yep!", nil];
        alertView.tag = 1;
        [alertView show];
    }
}

@end
