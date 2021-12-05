//
//  Operators.swift
//  SymEngine
//
//  Created by Ian Ruh on 4/24/20.
//

/*
 The non-optional and optional functions are so we can avoid excessive
 optional chaining when actually using them. The downside is the final
 result of most calulcations will almost always be optional and need
 to be unwrapped.
 */

import CSymEngine

//------------------------- Custom Precedence --------------------

// New precidence for power
precedencegroup ExponentiationPrecedence {
    associativity: right
    higherThan: MultiplicationPrecedence
}



//------------------------- Custom Operators --------------------

infix operator ** : ExponentiationPrecedence
infix operator **= : AssignmentPrecedence

//------------------------- Basic Extension --------------------
    
/**
 The + operator adds two basics.
 - Returns: The new basic.
 */
public func + (lhs: Basic, rhs: Basic) -> Basic {
    let new = Basic()
    basic_add(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The += operator adds two basics while mutating the first.
*/
public func += (lhs: inout Basic, rhs: Basic) {
    let new = Basic()
    basic_add(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The - operator subtracts two basics.
 
 - Returns: The new basic.
*/
public func - (lhs: Basic, rhs: Basic) -> Basic {
    let new = Basic()
    basic_sub(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The -= operator subtracts two basics while mutating the first.
*/
public func -= (lhs: inout Basic, rhs: Basic) {
    let new = Basic()
    basic_sub(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The * operator multiplies two basics.
 
 - Returns: The new basic.
*/
public func * (lhs: Basic, rhs: Basic) -> Basic {
    let new = Basic()
    basic_mul(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The *= operator multiplies two basics while mutating the first.
*/
public func *= (lhs: inout Basic, rhs: Basic) {
    let new = Basic()
    basic_mul(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The / operator divides two basics.
 
 - Returns: The new basic.
*/
public func / (lhs: Basic, rhs: Basic) -> Basic {
    let new = Basic()
    basic_div(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The /= operator divides two basics while mutating the first.
*/
public func /= (lhs: inout Basic, rhs: Basic) {
    let new = Basic()
    basic_div(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The ** operator takes the left side to the power of the right side.
 
 - Returns: The new basic.
*/
public func ** (lhs: Basic, rhs: Basic) -> Basic {
    let new = Basic()
    basic_pow(new.pointer, lhs.pointer, rhs.pointer)
    return new
}

/**
The **= operator takes the left side to the power of the right side while mutating the left side.
*/
public func **= (lhs: inout Basic, rhs: Basic) {
    let new = Basic()
    basic_pow(new.pointer, lhs.pointer, rhs.pointer)
    lhs = new
}

/**
The === operator compares two basics and returns whether they refer to the same basic object.
 
 - Returns: Whether the left side is the same basic the right side.
*/
public func === (lhs: Basic, rhs: Basic) -> Bool {
    return lhs.pointer == rhs.pointer
}
