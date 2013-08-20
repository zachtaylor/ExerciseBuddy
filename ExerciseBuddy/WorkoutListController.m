//
//  WorkoutListController.m
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/15/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import "WorkoutListController.h"
#import "ExerciseBuddyDataModel.h"

static NSString *showWorkoutSegueIdentifier = @"ShowWorkout";

@implementation WorkoutListController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [ExerciseBuddyDataModel routineCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"WorkoutListCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  Routine *routine = [ExerciseBuddyDataModel getRoutineAtIndex:indexPath.row];
  
  [self configureCell:cell withRoutine:routine];
  
  return cell;
}

- (void)configureCell:(UITableViewCell *)cell withRoutine:(Routine *)routine {
  [cell.textLabel setText:routine.name];
}

#pragma mark - Segue control stuff

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [self performSegueWithIdentifier:showWorkoutSegueIdentifier sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:showWorkoutSegueIdentifier]) {
    // TODO - real stuff here
  }
}

@end
