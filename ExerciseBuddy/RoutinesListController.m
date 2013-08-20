//
//  RoutinesListController.m
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/14/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import "RoutinesListController.h"
#import "ExerciseBuddyDataModel.h"

static NSString *routineListCellIdentifier = @"RoutineListCell";
static NSString *saveAddRoutineSegueIdentifier = @"SaveAddRoutine";

@implementation RoutinesListController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [ExerciseBuddyDataModel routineCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:routineListCellIdentifier forIndexPath:indexPath];
  
  Routine *routine = [ExerciseBuddyDataModel getRoutineAtIndex:indexPath.row];
  
  [self configureCell:cell withRoutine:routine];
  
  return cell;
}

- (void)configureCell:(UITableViewCell *)cell withRoutine:(Routine *)routine {
  [cell.textLabel setText:routine.name];
}

-(IBAction) unwindSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:saveAddRoutineSegueIdentifier]) {
    [ExerciseBuddyDataModel loadTheThings];
    [[self tableView] reloadData];
  }
}

@end
