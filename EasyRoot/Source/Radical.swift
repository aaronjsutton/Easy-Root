//
//  Radical.swift
//  EasyRoot
//
//  Created by Aaron Sutton on 1/22/18.
//

import Foundation

/// A radical expression. Radical expressions are simplified by calling the objects
/// `simplify()` method.
///
/// ## Usage
/// Create a new expression using integers with
///
/// The cube root of 27:
/// ```swift
/// let expression = Radical(root: 27, index: 3)
/// ```
///
/// ## Example
/// The square root of 27:
/// ```swift
/// let expression = Radical(root: 27)
/// print("Your expression is \(expression.radicand) square roots of \(expression.coefficient)")
/// // => Your expression is 1 square roots of 27 (root 27)
/// expression.simplify()
/// print("Your expression is \(expression.radicand) square roots of \(expression.coefficient)")
/// // => Your expression is 3 square roots of 3 (root 27)
///	```
/// ## Imaginary Numbers
/// `simplify()` will do nothing if simplification results in an imaginary number.
///
public final class Radical: Codable {

	/// The index of the radical expression
	/// Square root, cube root, etc.
	public var index: Int
	/// The number inside the root sign
	public var radicand: Int
	/// The number outside the root sign
	public var coefficient: Int = 1


	/// Create a new radical expression using only integers.
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
		// Guard against imaginary numbers
		if index % 2 == 0 && radicand < 0 {
			return
		}
		factor(radicand)
	}

	/// Factor a number by the perfect powers of the index
	///
	/// - Parameter number: The number to factor
	internal func factor(_ number: Int) {

		/// Reference to the radicand before factoring
		let unfactored = number

		/// Highest base
		let upperBase = base(bound: abs(number))

		/// The lowest base, 2 or -2
		let lowerBase: Int

		/// Every perfect power lower than the number
		let bases: CountableClosedRange<Int>

		// Determine the sign of the number and set range
		if number < 0 {
			lowerBase = -2
			bases = upperBase * -1...lowerBase
		} else {
			lowerBase = 2
			bases = lowerBase...upperBase
		}

		for base in bases {
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
		// If factoring was successful, recursivley factor the resulting radicand
		if unfactored != radicand {
			factor(radicand)
		}
	}

	/// Find the highest needed perfect power base
	///
	/// - Parameter number: The number
	/// - Returns: The base value
	internal func base(bound number: Int) -> Int {
		/// The base
		var base: Int = 0
		while base ** index <= number {
			base += 1
		}
		return base
	}
}
