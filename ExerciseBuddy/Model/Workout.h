//
//  Workout.h
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/15/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Lift, Routine;

@interface Workout : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSSet *lifts;
@property (nonatomic, retain) Routine *routine;
@end

@interface Workout (CoreDataGeneratedAccessors)

- (void)addLiftsObject:(Lift *)value;
- (void)removeLiftsObject:(Lift *)value;
- (void)addLifts:(NSSet *)values;
- (void)removeLifts:(NSSet *)values;

@end
