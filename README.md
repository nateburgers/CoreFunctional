CoreFunctional
==============

Lightweight Objective-C Functional Programming.

CoreFunctional is a set of polymorphic C functions for doing Type-Safe Function Programming with the
container classes in CoreFoundation. A secondary objective is to remain simple and semantic,
with minimal compiler magic. CoreFunctional is accomplished using the `overloadable` clang
function attribute.

## Supported Classes
- NSArray
- NSDictionary
- NSOrderedSet
- NSSet

### Apply
Partially applies a block to an argument, rightmost arguments are applied first.

### Each
Perform a side-effectful operation on each element in a collection

### Filter
Generate a new collection containing elements that satisfy a predicate

### Fold
Integrate a single result over each element in a collection

### Map
Element-wise generate a new collection

## Road Map
Functions
- FlatMap
