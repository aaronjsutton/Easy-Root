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

func **(left: Double, right: Double) -> Double {
	return pow(left, right)
}

func **(left: Int, right: Int) -> Int {
	return Int(pow(Double(left), Double(right)))
}

func ~~(index: Double, radicand: Double) -> Double {
	return pow(radicand, 1 / index)
}

func ~~(index: Int, radicand: Int) -> Int {
	return Int(pow(Double(radicand), 1.0 / Double(index)))
}

