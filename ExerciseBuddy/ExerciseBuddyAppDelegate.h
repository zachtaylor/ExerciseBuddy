//
//  ExerciseBuddyAppDelegate.h
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/13/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExerciseBuddyAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
