//
//  main.swift
//  EasyRoot CLI
//
//  Created by Aaron Sutton on 1/22/18.
//

import Foundation
import EasyRoot

var input: String

print("Nth Root: ", separator: "", terminator: "")

input = readLine() ?? ""

guard let index = Int(input) else {
	print("Enter a number.")
	exit(1)
}

print("Of: ", separator: "", terminator: "")

input = readLine() ?? ""

guard let radicand = Int(input) else {
	print("Enter a number.")
	exit(1)
}

let radical = Radical(root: radicand, index: index)
radical.simplify()

let result = String(radical.coefficient) + " root " + String(radical.radicand)

print(result)
