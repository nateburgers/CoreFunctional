//
//  RFSCoreFunctionalTest.m
//  RFSAdmin
//
//  Created by Nathan Burgers on 5/27/14.
//  Copyright (c) 2014 Nathan Burgers. All rights reserved.
//

#import "RFSCoreFunctionalTest.h"

TEST(testing_framework_functions) {
    RFSAssert(YES == YES);
    RFSAssertEqual(NO, NO);
    RFSAssertInequal(YES, NO);
}