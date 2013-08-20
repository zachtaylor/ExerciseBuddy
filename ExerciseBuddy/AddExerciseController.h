//
//  AddExerciseController.h
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/13/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddExerciseController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *muscleField;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UIStepper *weightStepper;

- (IBAction)valueChanged:(UIStepper *)sender;

@end
