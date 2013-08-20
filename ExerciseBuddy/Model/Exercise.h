//
//  Exercise.h
//  ExerciseBuddy
//
//  Created by Zach Taylor on 8/15/13.
//  Copyright (c) 2013 Zach Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Lift, Muscle, Routine;

@interface Exercise : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSSet *lifts;
@property (nonatomic, retain) Muscle *muscle;
@property (nonatomic, retain) NSSet *routines;
@end

@interface Exercise (CoreDataGeneratedAccessors)

- (void)addLiftsObject:(Lift *)value;
- (void)removeLiftsObject:(Lift *)value;
- (void)addLifts:(NSSet *)values;
- (void)removeLifts:(NSSet *)values;

- (void)addRoutinesObject:(Routine *)value;
- (void)removeRoutinesObject:(Routine *)value;
- (void)addRoutines:(NSSet *)values;
- (void)removeRoutines:(NSSet *)values;

@end
