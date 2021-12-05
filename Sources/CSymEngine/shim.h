#ifndef CLIB_SWIFT_SYMENGINE
#define CLIB_SWIFT_SYMENGINE

#import <symengine/cwrapper.h>;

// This is essentially a hack becuse of
// https://stackoverflow.com/questions/49932931/swift-cannot-find-private-struct-define-in-framework
struct CVectorInt { };
struct CVecBasic { };
struct CDenseMatrix { };

#endif
