//
//  Operator.swift
//  EasyRoot
//
//  Created by Aaron Sutton on 1/22/18.
//

import Foundation

precedencegroup ExponentPrecedence {
	associativity: left
	higherThan: MultiplicationPrecedence
}

infix operator **: ExponentPrecedence
infix operator ~~: ExponentPrecedence

/// Square the left by the right
///
/// - Parameters:
///   - left: The base
///   - right: The power
/// - Returns: The result
func **(left: Double, right: Double) -> Double {
	return pow(left, right)
}

/// Square the left by the right
///
/// - Parameters:
///   - left: The base
///   - right: The power
/// - Returns: The result
func **(left: Int, right: Int) -> Int {
	return Int(Double(left) ** Double(right))
}

/// Take the nth root of a number
///
/// - Parameters:
///   - index: The N
///   - radicand: The number inside the root sign
/// - Returns: The result
func ~~(index: Double, radicand: Double) -> Double {
	return pow(radicand, 1.0 / index)
}

/// Take the nth root of a number
///
/// - Parameters:
///   - index: The N
///   - radicand: The number inside the root sign
/// - Returns: The result
func ~~(index: Int, radicand: Int) -> Int {
	if radicand < 0 {
		return Int((Double(index) ~~ Double(radicand * -1)).rounded()) * -1
	} 
	return Int((Double(index) ~~ Double(radicand)).rounded())
}

