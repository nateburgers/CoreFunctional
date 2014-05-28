//
//  RFSCoreFunctional.m
//  RFSAdmin
//
//  Created by Nathan Burgers on 5/27/14.
//  Copyright (c) 2014 Nathan Burgers. All rights reserved.
//

#import "RFSCoreFunctional.h"

#pragma mark - Apply
id OVERLOADED RFSApply(RFSUnaryBlock f, id x) {
    return f(x);
}

RFSUnaryBlock OVERLOADED RFSApply(RFSBinaryBlock f, id x) {
    return ^(id y) {
        return f(x,y);
    };
}

RFSBinaryBlock OVERLOADED RFSApply(RFSTernaryBlock f, id x) {
    return ^(id y, id z) {
        return f(x,y,z);
    };
}

RFSTernaryBlock OVERLOADED RFSApply(RFSQuaternaryBlock f, id w) {
    return ^(id x, id y, id z) {
        return f(w,x,y,z);
    };
}

#pragma mark - Each
NSDictionary *OVERLOADED RFSEach(NSDictionary *input, void (^f)(id<NSCopying> key, id value)) {
  for (id<NSCopying> key in input.allKeys) {
    id value = input[key];
    f(key, value);
  }
}

NSSet *OVERLOADED RFSEach(NSSet *input, void (^f)(id element)) {
  for (id element in input) {
    f(element);
  }
}

NSArray *OVERLOADED RFSEach(NSArray *input, void (^f)(id element)) {
  for (id element in input) {
    f(element);
  }
}

#pragma mark - Filter
NSDictionary *OVERLOADED RFSFilter(NSDictionary *input, BOOL (^f)(id<NSCopying> key, id value)) {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    for (id<NSCopying> key in input.allKeys) {
        id value = input[key];
        if (f(key,value)) {
            [result setObject:value forKey:key];
        }
    }
    return result;
}

NSSet *OVERLOADED RFSFilter(NSSet *input, BOOL (^f)(id element)) {
    NSMutableSet *result = [NSMutableSet set];
    for (id element in input) {
        if (f(element)) {
            [result addObject:element];
        }
    }
    return result;
}

NSArray *OVERLOADED RFSFilter(NSArray *input, BOOL (^f)(id element)) {
    NSMutableArray *result = [NSMutableArray array];
    for (id element in input) {
        if (f(element)) {
            [result addObject:element];
        }
    }
    return result;
}

#pragma mark - Fold
NSDictionary *OVERLOADED RFSFold(NSDictionary *input, id init, id (^f)(id, id, id)) {
    for (id<NSCopying> key in input.allKeys) {
        id value = input[key];
        init = f(init, key, value);
    }
    return init;
}

NSSet *OVERLOADED RFSFold(NSSet *input, id init, id (^f)(id, id)) {
    for (id element in input) {
        init = f(init, element);
    }
    return init;
}

NSArray *OVERLOADED RFSFold(NSArray *input, id init, id (^f)(id, id)) {
    for (id element in input) {
        init = f(init, element);
    }
    return init;
}

#pragma mark - Map
NSDictionary *OVERLOADED RFSMap(NSDictionary *input, id (^f)(id value)) {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    for (id<NSCopying> key in input.allKeys) {
        id value = input[key];
        [result setObject:f(value) forKey:key];
    }
    return result;
}

NSDictionary *OVERLOADED RFSMap(NSDictionary *input, id (^f)(id<NSCopying> key, id value)) {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    for (id<NSCopying> key in input.allKeys) {
        id value = input[key];
        [result setObject:f(key, value) forKey:key];
    }
    return result;
}

NSSet *OVERLOADED RFSMap(NSSet *input, id (^f)(id element)) {
    NSMutableSet *result = [NSMutableSet set];
    for (id element in input) {
        [result addObject:f(element)];
    }
    return result;
}

NSArray *OVERLOADED RFSMap(NSArray *input, id (^f)(id element)) {
    NSMutableArray *result = [NSMutableArray array];
    for (id element in input) {
        [result addObject:element];
    }
    return result;
}
