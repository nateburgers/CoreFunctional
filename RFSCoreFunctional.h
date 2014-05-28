//
//  RFSCoreFunctional.h
//  RFSAdmin
//
//  Created by Nathan Burgers on 5/27/14.
//  Copyright (c) 2014 Nathan Burgers. All rights reserved.
//

#import <Foundation/Foundation.h>

#define OVERLOADED __attribute__((overloadable))

#pragma mark - Block Types
typedef id (^RFSUnaryBlock)(id);
typedef id (^RFSBinaryBlock)(id, id);
typedef id (^RFSTernaryBlock)(id, id, id);
typedef id (^RFSQuaternaryBlock)(id, id, id, id);

#pragma mark - Apply
id OVERLOADED RFSApply(RFSUnaryBlock, id x);
RFSUnaryBlock OVERLOADED RFSApply(RFSBinaryBlock, id x);
RFSBinaryBlock OVERLOADED RFSApply(RFSTernaryBlock, id x);
RFSTernaryBlock OVERLOADED RFSApply(RFSQuaternaryBlock, id x);

#pragma mark - Each
void OVERLOADED RFSEach(NSDictionary *input, void (^f)(id<NSCopying> key, id value));
void OVERLOADED RFSEach(NSDictionary *input, void (^f)(id value));
void OVERLOADED RFSEach(NSSet *input, void (^f)(id element));
void OVERLOADED RFSEach(NSArray *input, void (^f)(id element));
void OVERLOADED RFSEach(NSOrderedSet *input, void (^f)(id element));

#pragma mark - Filter
NSDictionary *OVERLOADED RFSFilter(NSDictionary *input, BOOL (^predicate)(id<NSCopying> key, id value));
NSDictionary *OVERLOADED RFSFilter(NSDictionary *input, BOOL (^predicate)(id value));
NSSet *OVERLOADED RFSFilter(NSSet *input, BOOL (^predicate)(id element));
NSArray *OVERLOADED RFSFilter(NSArray *input, BOOL (^predicate)(id element));
NSOrderedSet *OVERLOADED RFSFilter(NSOrderedSet *input, BOOL (^predicate)(id element));

#pragma mark - Fold
NSDictionary *OVERLOADED RFSFold(NSDictionary *input, id init, id (^f)(id accumulator, id<NSCopying> key, id value));
NSDictionary *OVERLOADED RFSFold(NSDictionary *input, id init, id (^f)(id accumulator, id value));
NSSet *OVERLOADED RFSFold(NSSet *input, id init, id (^f)(id accumulator, id element));
NSArray *OVERLOADED RFSFold(NSArray *input, id init, id (^f)(id accumulator, id element));
NSOrderedSet *OVERLOADED RFSFold(NSOrderedSet *input, id (^f)(id accumulator, id element));

#pragma mark - Map
NSDictionary *OVERLOADED RFSMap(NSDictionary *input, id (^f)(id<NSCopying> key, id value));
NSDictionary *OVERLOADED RFSMap(NSDictionary *input, id (^f)(id value));
NSSet *OVERLOADED RFSMap(NSSet *input, id (^f)(id element));
NSArray *OVERLOADED RFSMap(NSArray *input, id (^f)(id element));
NSOrderedSet *OVERLOADED RFSMap(NSOrderedSet *input, id (^f)(id element));
