//
//  AddRoutineController.h
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/14/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddRoutineController : UIViewController <UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@end
