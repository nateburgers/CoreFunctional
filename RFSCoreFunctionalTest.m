//
//  RFSCoreFunctionalTest.m
//  RFSCoreFunctional
//
//  Created by Nathan Burgers on 5/27/14.
//  Copyright (c) 2014 Nathan Burgers. All rights reserved.
//

#import "RFSCoreFunctionalTest.h"
#import "RFSCoreFunctional.h"

NSDictionary *RFSGenerateDictionary(NSUInteger size, id<NSCopying> (^keyForIndex)(NSUInteger idx), id (^valueForIndex)(NSUInteger idx)) {
    NSMutableDictionary *dictonary = [NSMutableDictionary dictionary];
    for (NSUInteger i=0; i<size; i++) {
        id<NSCopying> key = keyForIndex(i);
        id value = valueForIndex(i);
        [dictonary setObject:value forKey:key];
    }
    return dictonary;
}


TEST(RFSCoreFunctionalTest) {
    RFSAssert(YES == YES);
    RFSAssertEqual(NO, NO);
    RFSAssertInequal(YES, NO);
}

TEST(NSDictionary) {
    NSDictionary *testDict = RFSGenerateDictionary(1000, ^id<NSCopying>(NSUInteger idx) {
        return [NSNumber numberWithUnsignedInteger:idx];
    }, ^id(NSUInteger idx) {
        return [NSNumber numberWithUnsignedInteger:idx];
    });
    
    NSDictionary *newDict = RFSMap(testDict, ^NSNumber *(NSNumber *value) {
        return @(value.unsignedIntegerValue * 2);
    });
    
    RFSEach(newDict, ^(NSNumber *value) {
        RFSAssertEqual(value.unsignedIntegerValue % 2, 0);
    });
}

int main() {
    return 0;
}