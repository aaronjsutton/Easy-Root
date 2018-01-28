![Logo](https://aaronjsutton.github.io/EasyRoot/img/logo.png)

A Swift framework for simplifying radicals.

[![Build Status](https://travis-ci.org/aaronjsutton/EasyRoot.svg?branch=master)](https://travis-ci.org/aaronjsutton/EasyRoot)

## Usage

### [CocoaPods](http://cocoapods.org)

Add EasyRoot to your Podfile:

```ruby
pod 'EasyRoot'
```

And run `pod install`

## Example

To use the `Radical` object:
```swift
// Simplify the square root of 27
// Create the radical object
let expression = Radical(root: 27)
// Simplify the expression
expression.simplify()
// Print the result
print("\(expression.coefficient) roots of \(expression.radicand)")
// => 3 roots of 3
```

Currently, the expression will remain the same if the simplified result contains an imaginary number.

For more examples, see the [documentation](https://aaronjsutton.github.io/EasyRoot/)

## Features

Currently supports simplifying integer-only radicals. For example:

- Root 4
  - Result: 2
- 3 root -27
  - Result: -3

And so forth.

## Contributing

#### Bugs

Feel free to open issues for any bugs found.

#### Pull Requests

If you wish to contribute to EasyRoot, create a new branch, implement your feature or fix, and then submit a pull request.

#### Documentation

Generate documentation with [Jazzy](https://github.com/realm/jazzy)
