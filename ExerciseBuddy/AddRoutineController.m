//
//  AddRoutineController.m
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/14/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import "AddRoutineController.h"
#import "ExerciseBuddyDataModel.h"

@interface AddRoutineController()

@property NSMutableDictionary *toggleStates;
@property NSMutableArray *exercises;

@end

static NSString *CellIdentifier = @"AddRoutineExerciseCell";
static NSString *saveAddRoutineSegueIdentifier = @"SaveAddRoutine";

@implementation AddRoutineController

- (id)initWithCoder:(NSCoder *)aDecoder {
  self = [super initWithCoder:aDecoder];
  
  if (self) {
    _toggleStates = [[NSMutableDictionary alloc] init];
    _exercises = [[NSMutableArray alloc] init];
  }
  
  return self;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

#pragma mark - table data provider

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
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  Muscle *muscle = [ExerciseBuddyDataModel getMuscleAtIndex:indexPath.section];
  Exercise *exercise = [muscle.exercises allObjects][indexPath.row];
  
  [self configureCell:cell withExercise:exercise];
  
  return cell;
}

- (void)configureCell:(UITableViewCell *)cell withExercise:(Exercise *)exercise {
  UISwitch *toggle = [[UISwitch alloc] initWithFrame:CGRectZero];
  [toggle addTarget:self action:@selector(onToggle:) forControlEvents:UIControlEventValueChanged];
  self.toggleStates[@(toggle.hash)] = exercise.name;
  
  [cell.textLabel setText:exercise.name];
  cell.accessoryView = toggle;
}

- (void)onToggle:(UISwitch *)toggle {
  if (toggle.on) {
    [self.exercises addObject:self.toggleStates[@(toggle.hash)]];
  }
  else {
    [self.exercises removeObject:self.toggleStates[@(toggle.hash)]];
  }
}

#pragma mark - segue stuff

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:saveAddRoutineSegueIdentifier]) {
    NSString *name = [self.nameField text];
    
    [ExerciseBuddyDataModel insertRoutineNamed:name withExercises:self.exercises];
  }
}

@end
