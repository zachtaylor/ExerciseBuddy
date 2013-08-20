//
//  LiftCell.h
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/15/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExerciseBuddyDataModel.h"

@interface LiftCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *repsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end
