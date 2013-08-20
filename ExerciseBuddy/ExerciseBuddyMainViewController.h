//
//  ExerciseBuddyMainViewController.h
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/13/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import "ExerciseBuddyFlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface ExerciseBuddyMainViewController : UITabBarController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
