//
//  ExerciseBuddyFlipsideViewController.h
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/13/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExerciseBuddyFlipsideViewController;

@protocol ExerciseBuddyFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(ExerciseBuddyFlipsideViewController *)controller;
@end

@interface ExerciseBuddyFlipsideViewController : UIViewController

@property (weak, nonatomic) id <ExerciseBuddyFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
