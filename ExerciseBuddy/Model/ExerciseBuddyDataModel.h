//
//  ExerciseListModel.h
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/13/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Muscle.h"
#import "Exercise.h"
#import "Routine.h"
#import "Lift.h"
#import "Workout.h"

@interface ExerciseBuddyDataModel : NSObject

+ (void)initWithContext:(NSManagedObjectContext *)context;
+ (void)loadTheThings;

+ (NSUInteger)muscleCount;
+ (Muscle *)getMuscleAtIndex:(NSUInteger)index;
+ (Muscle *)getMuscleForName:(NSString *)name;

+ (Exercise *)getExerciseForName:(NSString *)name;
+ (void)insertExerciseNamed:(NSString *)name withWeight:(NSNumber *)weight withMuscle:(NSString *)muscleName;

+ (NSUInteger)routineCount;
+ (Routine *)getRoutineAtIndex:(NSUInteger)index;
+ (Routine *)getRoutineForName:(NSString *)name;
+ (void)insertRoutineNamed:(NSString *)name withExercises:(NSArray *)exerciseNames;

@end
