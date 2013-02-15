//
//  SJENNoteListViewController.m
//  EveryNote
//
//  Created by Steve Jackson on 10/25/12.
//  Copyright (c) 2012 Steve Jackson. All rights reserved.
//

#import "SJENNoteListViewController.h"
#import "Note.h"

@interface SJENNoteListViewController () {

    NSMutableArray *notes;

}
@end

@implementation SJENNoteListViewController

@synthesize managedObjectContext = _managedObjectContext;

- (void) savedNote:(SJENAddNoteViewController *)controller {
    // Save note here
    
    NSManagedObjectContext *context = [self managedObjectContext];
    Note *note = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Note"
                  inManagedObjectContext:context];
    
    note.title = controller.NoteTitle;
    note.content = controller.NoteContent;
    
    note.createDate = [NSDate date];
    note.lastUpdate = [NSDate date];
    
    NSError *error = nil;
    [context save:&error];
    
    [notes addObject: note];
    [[self tableView] reloadData];
    
    [controller.navigationController popToRootViewControllerAnimated:YES];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *error = nil;
    NSArray *savedNotes;
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Note"
                                              inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    savedNotes = [context executeFetchRequest:fetchRequest error:&error];
    notes = [[NSMutableArray alloc] initWithArray:savedNotes];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NoteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Note *note = [notes objectAtIndex:indexPath.row];
    
    cell.textLabel.text = note.title;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ([segue.identifier isEqualToString:@"AddNoteSegue"]) {
        SJENAddNoteViewController* addNoteController = segue.destinationViewController;
        addNoteController.NoteDelegate = self;
    }
}

@end
