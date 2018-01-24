//
//  EasyRootTests.swift
//  EasyRootTests
//
//  Created by Aaron Sutton on 1/22/18.
//

import XCTest
@testable import EasyRoot

class EasyRootTests: XCTestCase {

	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}

	func testRadicalCreate() {
		let radical = Radical(root: 9)
		XCTAssert(radical.radicand == 9)
		XCTAssert(radical.coefficient == 1)
	}

	func runFactor(values: (Int, Int)) -> (Int, Int) {
		let radical = Radical(root: values.1, index: values.0)
		radical.simplify()
		return (radical.coefficient, radical.radicand)
	}

	func testFactor() {
		let testCases: [((Int, Int), (Int, Int))] = [
			((2, 4), (2, 1)),
			((2, 52), (2, 13)),
			((2, 162), (9, 2)),
			((3, -320), (-4, 5)),
			((4, 432), (2, 27)),
			((3, -27), (-3, 1)),
			((4, 512), (4, 2)),
			((3, -6561), (-9, 9)),
			((5, -12288), (-4, 12))
		]
		for set in testCases {
			let result = runFactor(values: set.0)
			print("\(result.0) roots of \(result.1)")
			XCTAssert(result == set.1)
		}
	}

	func testImaginary() {
		let imaginary = Radical(root: -2)
		imaginary.simplify()
		XCTAssert(imaginary.radicand == -2)
	}

	func testPerformanceFactor() {
		let base = 24
		let power = 12
		let radicand = base ** power
		let factor = 40

		var radical: Radical
		radical = Radical(root: radicand * factor, index: power)
		self.measure {
			radical.simplify()
		}
		XCTAssert(radical.coefficient == base && radical.radicand == factor)
		print("\(radical.coefficient) roots of \(radical.radicand)")

	}

	func testOperators() {
		XCTAssert(2 ** 2 == 4)
		XCTAssert(2 ~~ 4 == 2)
		XCTAssert(3 ~~ 27 == 3)
	}

	func testBaseBound() {
		var radical: Radical
		radical = Radical(root: 9)
		XCTAssert(radical.base(bound: radical.radicand) == 4)
		radical = Radical(root: 2)
		XCTAssert(radical.base(bound: radical.radicand) == 2)
	}

	func testStringInit() {
		let radical = Radical(index: 2, radicand: "4")
		XCTAssert(radical != nil)
		XCTAssertNil(Radical(index: 1, radicand: "?3&"))
	}

	func testIntegerRegex() {
		let radical = Radical(index: 2, radicand: "4")

	}

}
