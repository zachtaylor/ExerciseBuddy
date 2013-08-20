//
//  AddExerciseController.m
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/13/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import "AddExerciseController.h"
#import "Model/ExerciseBuddyDataModel.h"

@implementation AddExerciseController

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)valueChanged:(UIStepper *)stepper {
    int value = (int) [stepper value];
    
    [self.weightLabel setText:[NSString stringWithFormat:@"%d", value]];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    static NSString *saveAddExerciseSegueIdentifier = @"SaveAddExercise";
    
    if ([[segue identifier] isEqualToString:saveAddExerciseSegueIdentifier]) {
      NSString *exerciseName = [[self nameField] text];
      NSNumber *weight = @([self.weightStepper value]);
      NSString *muscleName = [[self muscleField] text];
      
      [ExerciseBuddyDataModel insertExerciseNamed:exerciseName withWeight:weight withMuscle:muscleName];
    }
}

@end
