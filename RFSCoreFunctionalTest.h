//
//  RFSCoreFunctionalTest.h
//  RFSCoreFunctional
//
//  Created by Nathan Burgers on 5/27/14.
//  Copyright (c) 2014 Nathan Burgers. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>

#ifdef TESTING
    #define TEST(__TESTNAME) void __attribute__((constructor)) __TESTNAME##_test()
#else
    #define TEST(__TESTNAME) void __TESTNAME##_test()
#endif

#define PASS "\033[32mPASS\033[0m"
#define FAIL "\033[31mFAIL\033[0m"
#define RFSAssert(__PREDICATE) printf("%s [%s:%d] %s\n",__PREDICATE?PASS:FAIL,__FUNCTION__,__LINE__,#__PREDICATE)
#define RFSAssertEqual(__X,__Y) RFSAssert(__X == __Y)
#define RFSAssertInequal(__X,__Y) RFSAssert(__X != __Y)