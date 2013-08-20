//
//  ExerciseListController.m
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/13/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import "ExerciseListController.h"
#import "Model/ExerciseBuddyDataModel.h"
#import "ExerciseBuddyMainViewController.h"
#import "AddExerciseController.h"

@implementation ExerciseListController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [ExerciseBuddyDataModel muscleCount];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  Muscle *muscle = [ExerciseBuddyDataModel getMuscleAtIndex:section];
  return [muscle.exercises count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  Muscle *muscle = [ExerciseBuddyDataModel getMuscleAtIndex:section];
  return muscle.name;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"ExerciseListCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  Muscle *muscle = [ExerciseBuddyDataModel getMuscleAtIndex:indexPath.section];
  Exercise *exercise = [muscle.exercises allObjects][indexPath.row];
  
  [self configureCell:cell withExercise:exercise];
  
  return cell;
}

- (void)configureCell:(UITableViewCell *)cell withExercise:(Exercise *)exercise {
    [cell.textLabel setText:exercise.name];
}

#pragma mark - Segue handling

-(IBAction) unwindSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    static NSString *saveAddExerciseSegueIdentifier = @"SaveAddExercise";
    
    if ([[segue identifier] isEqualToString:saveAddExerciseSegueIdentifier]) {
        [[self tableView] reloadData];
    }
}

@end
