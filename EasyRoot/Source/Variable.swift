//
//  Variable.swift
//  EasyRoot
//
//  Created by Aaron Sutton on 1/23/18.
//

import Foundation

/// A letter variable and an exponent value
/// Variable objects are created only by radical strings
public final class Variable: Codable {
	/// The letter of the variable
	public var name: String
	/// The power the variable is raised to
	public var exponent: Int

	/// Create a variable
	/// Used only by Radical internals
	///
	/// - Parameters:
	///   - name: Name `x`
	///   - power: Raised to `n`
	private init(_ name: String, _ power: Int) {
		self.name = name
		exponent = power
	}
}
