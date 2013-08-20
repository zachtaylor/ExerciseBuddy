//
//  LiftDetailController.m
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/15/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import "LiftsDetailController.h"
#import "LiftCell.h"

@interface LiftsDetailController()

@property (nonatomic, strong) NSMutableDictionary *lifts;

@end

static NSString *CellIdentifier = @"LiftCell";

@implementation LiftsDetailController

- (NSMutableDictionary *)lifts {
  if (_lifts == nil) {
    _lifts = [[NSMutableDictionary alloc] init];
  }
  
  return _lifts;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  LiftCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  
  NSString *targetReps;
  if (indexPath.row == 2) {
    targetReps = @"10";
  }
  else if (indexPath.row == 1) {
    targetReps = @"8";
  }
  else {
    targetReps = @"4";
  }
  
  [cell.nameLabel setText:[self.exercise name]];
  [cell.repsLabel setText:[NSString stringWithFormat:@"0/%@ reps", targetReps]];
  [cell.stepper addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
  [self lifts][@([cell.stepper hash])] = cell;
  
  return cell;
}

- (void)valueChanged:(UIStepper *)stepper {
  NSLog(@"Foo bar");
}

@end
