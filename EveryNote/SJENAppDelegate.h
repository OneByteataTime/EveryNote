//
//  SJENAppDelegate.h
//  EveryNote
//
//  Created by Steve Jackson on 10/25/12.
//  Copyright (c) 2012 Steve Jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJENAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
