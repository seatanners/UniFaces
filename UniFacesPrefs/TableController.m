//
//  TableController.m
//  UniFaces
//
//  Created by seatanners on 1/30/14.
//
//

#import "TableController.h"

@interface TableController ()
@property (strong, nonatomic) Preferences* prefs;
@property (strong, nonatomic) UITableView* tableView;
@end

@implementation TableController

- (id)initWithPreferences:(Preferences *)p andTableView:(UITableView*)tableView
{
    self = [super init];
    if (self) {
        self.prefs = p;
        self.tableView = tableView;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.prefs.dictionary valueForKey:@"faces"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ListItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [[self.prefs.dictionary valueForKey:@"faces"] objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray* array = [self.prefs.dictionary valueForKey:@"faces"];
        NSMutableArray* mutArray = array.mutableCopy;
        [mutArray removeObjectAtIndex:indexPath.row];
        [self.prefs.dictionary setValue:mutArray.copy forKey:@"faces"];
    
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self.prefs save];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSArray* array = [self.prefs.dictionary valueForKey:@"faces"];
    NSMutableArray* mutArray = array.mutableCopy;
    
    NSString* str = [mutArray objectAtIndex:fromIndexPath.row];
    
    [mutArray removeObjectAtIndex:fromIndexPath.row];
    [mutArray insertObject:str atIndex:toIndexPath.row];
    
    [self.prefs.dictionary setValue:mutArray.copy forKey:@"faces"];
    
    [self.prefs save];
}

-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == [alertView firstOtherButtonIndex]) {
        if(alertView.tag == 0) { //Add dialog
            NSArray* array = [self.prefs.dictionary valueForKey:@"faces"];
            NSMutableArray* mutArray = array.mutableCopy;
        
            NSString* text = [[[alertView textFieldAtIndex:0] text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if (text && ![text isEqualToString:@""]) {
                [mutArray insertObject:text atIndex:0];
                [self.prefs.dictionary setValue:mutArray.copy forKey:@"faces"];
        
                [self.tableView beginUpdates];
                [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
                [self.tableView endUpdates];
            
                [self.prefs save];
            }
        } else if(alertView.tag == 1) { //Reset dialog
            NSLog(@"Alert view");
            [self.prefs reset];
            [self.tableView reloadData];
        }
    }
}

@end
