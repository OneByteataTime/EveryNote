//
//  SJENAddNoteViewController.h
//  EveryNote
//
//  Created by Steve Jackson on 10/25/12.
//  Copyright (c) 2012 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SJENAddNoteViewController;

@protocol AddNoteDelegate

- (void) savedNote:(SJENAddNoteViewController *) controller;

@end

@interface SJENAddNoteViewController : UITableViewController

@property (nonatomic, weak) id <AddNoteDelegate> NoteDelegate;
@property (nonatomic, copy) NSString *NoteTitle;
@property (nonatomic, copy) NSString *NoteContent;

@end
