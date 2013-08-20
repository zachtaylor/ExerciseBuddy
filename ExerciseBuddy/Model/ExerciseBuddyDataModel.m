//
//  ExerciseListModel.m
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/13/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import "ExerciseBuddyDataModel.h"

static NSManagedObjectContext *_context;
static NSMutableDictionary *muscles;
static NSMutableDictionary *exercises;
static NSMutableDictionary *routines;

@implementation ExerciseBuddyDataModel

+ (void)initWithContext:(NSManagedObjectContext *)context {
  _context = context;
  
  [ExerciseBuddyDataModel loadTheThings];
}

+ (void)loadTheThings {
  NSError *error;
  NSFetchRequest *request;
  NSArray *results;
  
  request = [[NSFetchRequest alloc] initWithEntityName:@"Routine"];
  results = [_context executeFetchRequest:request error:&error];
  if (results == nil) { return; }
  
  routines = [[NSMutableDictionary alloc] init];
  for (Routine *routine in results) {
    routines[routine.name] = routine;
  }
  
  request = [[NSFetchRequest alloc] initWithEntityName:@"Exercise"];
  results = [_context executeFetchRequest:request error:&error];
  if (results == nil) { return; }
  
  exercises = [[NSMutableDictionary alloc] init];
  for (Exercise *exercise in results) {
    exercises[exercise.name] = exercise;
  }
  
  request = [[NSFetchRequest alloc] initWithEntityName:@"Muscle"];
  results = [_context executeFetchRequest:request error:&error];
  if (results == nil) { return; }
  
  muscles = [[NSMutableDictionary alloc] init];
  for (Muscle *muscle in results) {
    muscles[muscle.name] = muscle;
  }
}

+ (void)insertExerciseNamed:(NSString *)name withWeight:(NSNumber *)weight withMuscle:(NSString *)muscleName {
  Exercise *exercise = [NSEntityDescription insertNewObjectForEntityForName:@"Exercise" inManagedObjectContext:_context];
  
  exercise.name = name;
  exercise.weight = weight;
  exercise.muscle = [ExerciseBuddyDataModel getMuscleForName:muscleName];
  
  NSError *error;
  if (![_context save:&error]) {
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
}

+ (NSUInteger)muscleCount {
  return [muscles count];
}

+ (Muscle *)getMuscleAtIndex:(NSUInteger)index {
  return muscles[[muscles allKeys][index]];
}

+ (Muscle *)getMuscleForName:(NSString *)name {
  if (muscles[name] == nil) {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Muscle"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name LIKE[c] %@", name];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *results = [_context executeFetchRequest:request error:&error];
    
    if (results == nil || [results count] < 1) {
      Muscle *muscle = [NSEntityDescription insertNewObjectForEntityForName:@"Muscle" inManagedObjectContext:_context];
      muscle.name = name;
      muscles[name] = muscle;
    }
    else {
      muscles[name] = results[0];
    }
  }
  
  return muscles[name];
}

+ (Exercise *)getExerciseForName:(NSString *)name {
  return exercises[name];
}

+ (NSUInteger)routineCount {
  return [routines count];
}

+ (Routine *)getRoutineAtIndex:(NSUInteger)index {
  return routines[[routines allKeys][index]];
}

+ (Routine *)getRoutineForName:(NSString *)name {
  return routines[name];
}

+ (void)insertRoutineNamed:(NSString *)name withExercises:(NSArray *)exerciseNames {
  Routine *routine = [NSEntityDescription insertNewObjectForEntityForName:@"Routine" inManagedObjectContext:_context];
  
  routine.name = name;
  
  for (NSString *exerciseName in exerciseNames) {
    Exercise *exercise = [ExerciseBuddyDataModel getExerciseForName:exerciseName];
    
    [routine addExercisesObject:exercise];
  }
  
  NSError *error;
  if (![_context save:&error]) {
    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    abort();
  }
}

@end
