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

	func testFactor() {
		var radical: Radical
		radical = Radical(root: 216)
		radical.simplify()
		XCTAssert(radical.radicand == 6 && radical.coefficient == 6)
		radical = Radical(root: 8, index: 3)
		radical.simplify()
		XCTAssert(radical.radicand == 1 && radical.coefficient == 2)
		radical = Radical(root: 45)
		radical.simplify()
		XCTAssert(radical.radicand == 5 && radical.coefficient == 3)

	}

	func testPerformanceFactor() {
		var radical: Radical
		radical = Radical(root: 749809)
		self.measure {
			radical.simplify()
		}
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

}
