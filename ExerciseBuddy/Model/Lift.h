//
//  Lift.h
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/15/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Exercise, Workout;

@interface Lift : NSManagedObject

@property (nonatomic, retain) NSNumber * reps;
@property (nonatomic, retain) NSNumber * set;
@property (nonatomic, retain) NSNumber * targetReps;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) Exercise *exercise;
@property (nonatomic, retain) Workout *workout;

@end
