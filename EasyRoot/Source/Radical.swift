//
//  Radical.swift
//  EasyRoot
//
//  Created by Aaron Sutton on 1/22/18.
//

import Foundation

public final class Radical: Codable {


	enum Term {
		case root
		case coefficient
	}

	public var index: Int
	public var radicand: Int
	public var coefficient: Int = 1

	public init(root: Int, index: Int = 2) {
		radicand = root
		self.index = index
	}

	func simplify() {
		let result = factor(radicand)
	}

	internal func factor(_ number: Int) -> FactorResult {
		var roots: [Int] = []
		var coefficients: [Int] = []

		let upperBase = base(bound: number)

		for base in 1...upperBase {
			// Perfect power case
			if number == base ** index {
				coefficients.append(index ~~ number)
				break
			}
			// Divisible by perfect power case
			if (base ** index % number) == 0 {
				coefficients.append(<#T##newElement: Int##Int#>)
			}

			// Not divisible case

		}

		return FactorResult(roots: roots, coefficients: coefficients)
	}

	internal func base(bound number: Int) -> Int {
		var base: Int = 0
		while base ** index <= number {
			base += 1
		}
		return base
	}
}

