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
		let radical = Radical(root: 9)
		radical.simplify()
	}

	func testOperators() {
		XCTAssert(2 ** 2 == 4)
		XCTAssert(2 ~~ 4 == 2)
		XCTAssert(3 ~~ 27 == 3)
	}

	func testBaseBound() {
		var radical: Radical
		radical = Radical(root: 9)
		XCTAssert(radical.base(bound: radical.radicand) == 3)
		radical = Radical(root: 2)
		XCTAssert(radical.base(bound: radical.radicand) == 1)
	}

}
