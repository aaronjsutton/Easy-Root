//
//  Radical.swift
//  EasyRoot
//
//  Created by Aaron Sutton on 1/22/18.
//

import Foundation

/// A class representation of a radical expression
public final class Radical: Codable {

	/// The index of the radical expression
	/// Square root, cube root, etc.
	public var index: Int
	/// The number inside the root sign
	public var radicand: Int
	/// The number outside the root sign
	public var coefficient: Int = 1

	/// Create a new radical expression
	///
	/// - Parameters:
	///   - root: The number inside the root sign
	///   - index: The index of the radical, defaults to square root
	public init(root: Int, index: Int = 2) {
		radicand = root
		self.index = index
	}

	/// Simplify the radical
	public func simplify() {
		_ = factor(radicand)
	}

	/// Factor a number by the perfect powers of the index
	///
	/// - Parameter number: The number to factor
	internal func factor(_ number: Int) {

		let upperBase = base(bound: number)
		let unfactored = number

		for base in 2...upperBase {
			// Perfect power case
			let perfect = base ** index
			if number == perfect {
				coefficient *= (index ~~ number)
				radicand = 1
				break
			}
			// Divisible by perfect power case
			if (number % perfect) == 0 {
				coefficient *= (index ~~ perfect)
				radicand = (number / perfect)
				break
			}
		}
		if unfactored != radicand {
			factor(radicand)
		}
	}

	/// Find the highest needed perfect power base
	///
	/// - Parameter number: The number
	/// - Returns: The base value
	internal func base(bound number: Int) -> Int {
		var base: Int = 0
		while base ** index <= number {
			base += 1
		}
		return base
	}
}

