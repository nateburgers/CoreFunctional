//
//  RFSCoreFunctional.m
//  RFSCoreFunctional
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
void OVERLOADED RFSEach(NSDictionary *input, void (^f)(id<NSCopying> key, id value)) {
    [input enumerateKeysAndObjectsUsingBlock:^(id<NSCopying> key, id obj, BOOL *stop) {
        f(key, obj);
    }];
}

void OVERLOADED RFSEach(NSDictionary *input, void (^f)(id value)) {
    for (id value in input.allValues) {
        f(value);
    }
}

void _RFSEach(id collection, void (^f)(id element)) {
    for (id element in collection) {
        f(element);
    }
}

void OVERLOADED RFSEach(NSSet *input, void (^f)(id element)) {
    _RFSEach(input, f);
}

void OVERLOADED RFSEach(NSArray *input, void (^f)(id element)) {
    _RFSEach(input, f);
}

void OVERLOADED RFSEach(NSOrderedSet *input, void (^f)(id element)) {
    _RFSEach(input, f);
}

#pragma mark - Filter
NSDictionary *OVERLOADED RFSFilter(NSDictionary *input, BOOL (^f)(id<NSCopying> key, id value)) {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [input enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (f(key, obj)) {
            [result setObject:obj forKey:key];
        }
    }];
    return result;
}

NSDictionary *OVERLOADED RFSFilter(NSDictionary *input, BOOL (^f)(id value)) {
    return RFSFilter(input, ^BOOL(id<NSCopying> key, id value) {
        return f(value);
    });
}

id _RFSFilter(id collection, id resultCollection, BOOL (^f)(id element)) {
    for (id element in collection) {
        if (f(element)) {
            [resultCollection addObject:element];
        }
    }
    return resultCollection;
}

NSSet *OVERLOADED RFSFilter(NSSet *input, BOOL (^f)(id element)) {
    return _RFSFilter(input, [NSMutableSet set], f);
}

NSArray *OVERLOADED RFSFilter(NSArray *input, BOOL (^f)(id element)) {
    return _RFSFilter(input, [NSMutableArray array], f);
}

NSOrderedSet *OVERLOADED RFSFilter(NSOrderedSet *input, BOOL (^f)(id element)) {
    return _RFSFilter(input, [NSMutableOrderedSet orderedSet], f);
}

#pragma mark - Fold
NSDictionary *OVERLOADED RFSFold(NSDictionary *input, id init, id (^f)(id, id, id)) {
    __block id result = init;
    [input enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        result = f(init, key, obj);
    }];
    return result;
}

NSDictionary *OVERLOADED RFSFold(NSDictionary *input, id init, id (^f)(id, id)) {
    for (id value in input.allValues) {
        init = f(init, value);
    }
    return init;
}

id _RFSFold(id collection, id init, id (^f)(id, id)) {
    for (id element in collection) {
        init = f(init, element);
    }
    return init;
}

NSSet *OVERLOADED RFSFold(NSSet *input, id init, id (^f)(id, id)) {
    return _RFSFold(input, init, f);
}

NSArray *OVERLOADED RFSFold(NSArray *input, id init, id (^f)(id, id)) {
    return _RFSFold(input, init, f);
}

NSOrderedSet *OVERLOADED RFSFold(NSOrderedSet *input, id init, id (^f)(id, id)) {
    return _RFSFold(input, init, f);
}

#pragma mark - GroupBy
NSDictionary *OVERLOADED RFSGroupBy(NSDictionary *input, id (^f)(id<NSCopying> key, id value)) {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [input enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id groupKey = f(key, obj);
        if (result[groupKey] == nil) {
            result[groupKey] = [NSMutableArray arrayWithObject:obj];
        } else {
            NSMutableArray *group = result[groupKey];
            [group addObject:obj];
        }
    }];
    return result;
}

NSDictionary *OVERLOADED RFSGroupBy(NSDictionary *input, id (^f)(id value)) {
    return RFSGroupBy(input, ^id(id<NSCopying> key, id value) {
        return f(value);
    });
}

NSDictionary *_RFSGroupBy(id indexedObject, id (^f)(id element)) {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    for (id element in indexedObject) {
        id groupKey = f(element);
        if (result[groupKey] == nil) {
            result[groupKey] = [NSMutableArray arrayWithObject:element];
        } else {
            NSMutableArray *group = result[groupKey];
            [group addObject:element];
        }
    }
    return result;
}

NSDictionary *OVERLOADED RFSGroupBy(NSSet *input, id (^f)(id element)) {
    return _RFSGroupBy(input, f);
}

NSDictionary *OVERLOADED RFSGroupBy(NSArray *input, id (^f)(id element)) {
    return _RFSGroupBy(input, f);
}

NSDictionary *OVERLOADED RFSGroupBy(NSOrderedSet *input, id (^f)(id element)) {
    return _RFSGroupBy(input, f);
}

#pragma mark - Map
NSDictionary *OVERLOADED RFSMap(NSDictionary *input, id (^f)(id<NSCopying> key, id value)) {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [input enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [result setObject:f(key, obj) forKey:key];
    }];
    return result;
}

NSDictionary *OVERLOADED RFSMap(NSDictionary *input, id (^f)(id value)) {
    return RFSMap(input, ^id(id<NSCopying> key, id value) {
        return f(value);
    });
}

id _RFSMap(id collection, id resultCollection, id (^f)(id element)) {
    for (id element in collection) {
        [resultCollection addObject:f(element)];
    }
    return resultCollection;
}

NSSet *OVERLOADED RFSMap(NSSet *input, id (^f)(id element)) {
    return _RFSMap(input, [NSMutableSet set], f);
}

NSArray *OVERLOADED RFSMap(NSArray *input, id (^f)(id element)) {
    return _RFSMap(input, [NSMutableArray array], f);
}

NSOrderedSet *OVERLOADED RFSMap(NSOrderedSet *input, id (^f)(id element)) {
    return _RFSMap(input, [NSMutableOrderedSet orderedSet], f);
}
