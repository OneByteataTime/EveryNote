//
//  SJENNoteListViewController.h
//  EveryNote
//
//  Created by Steve Jackson on 10/25/12.
//  Copyright (c) 2012 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "SJENAddNoteViewController.h"

@interface SJENNoteListViewController : UITableViewController <AddNoteDelegate> 

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
