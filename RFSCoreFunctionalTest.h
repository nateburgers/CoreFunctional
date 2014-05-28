//
//  RFSCoreFunctionalTest.h
//  RFSAdmin
//
//  Created by Nathan Burgers on 5/27/14.
//  Copyright (c) 2014 Nathan Burgers. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef TESTING
    #define TEST(__TESTNAME) void __attribute__((constructor)) __TESTNAME()
#else
    #define TEST(__TESTNAME) void __TESTNAME()
#endif

#define RFSAssert(__PREDICATE) NSLog(@"%s [%s:%d] %s",__PREDICATE?"PASS":"FAIL",__FUNCTION__,__LINE__,#__PREDICATE)
#define RFSAssertEqual(__X,__Y) RFSAssert(__X == __Y)
#define RFSAssertInequal(__X,__Y) RFSAssert(__X != __Y)