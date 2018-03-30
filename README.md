# SMLib
[![Travis CI](https://travis-ci.org/tosbaha/SMLib.svg?branch=master)](https://travis-ci.org/tosbaha/SMLib)
[![Code coverage status](http://codecov.io/github/tosbaha/SMLib/coverage.svg?branch=master)](http://codecov.io/github/tosbaha/SMLib)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![CocoaPods](https://img.shields.io/cocoapods/v/SMLib.svg) ![Platform](https://img.shields.io/cocoapods/p/SMLib.svg?style=flat)
![Swift 4.1](https://img.shields.io/badge/Swift-4.1-orange.svg)

SMLib is a small library which implements [SuperMemo SM2 Algorithm](https://www.supermemo.com/english/ol/sm2.htm).

1. [Requirements](#requirements)
2. [Integration](#integration)
3. [Usage](#usage)
4. [Contributions](#contributions)
5. [License](#license)

## Requirements

- iOS 8.0+ | macOS 10.10+ | tvOS 9.0+ | watchOS 2.0+
- Xcode 9+

## Integration

#### CocoaPods (iOS 8+, OS X 10.9+)

You can use [CocoaPods](http://cocoapods.org/) to install `SMLib`by adding it to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
	pod 'SMLib'
end
```

Note that this requires CocoaPods version 36, and your iOS deployment target to be at least 8.0:


#### Carthage (iOS 8+, OS X 10.9+)

You can use [Carthage](https://github.com/Carthage/Carthage) to install `SMLib` by adding it to your `Cartfile`:

```
github "tosbaha/SMLib"
```

#### Swift Package Manager

You can use [The Swift Package Manager](https://swift.org/package-manager) to install `SMLib` by adding the proper description to your `Package.swift` file:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/tosbaha/SMLib.git", majorVersion: 1),
    ]
)
```

Note that the [Swift Package Manager](https://swift.org/package-manager) is still in early design and development, for more information checkout its [GitHub Page](https://github.com/apple/swift-package-manager)


## Usage

```swift
import SMLib

let card = Flashcard(front: "Front", back: "Back")
let flashcardgrade = Grade.pass
let engine = SM2Engine()
let gradedCard = engine.gradeFlashcard(flashcard: card, grade: flashcardgrade, currentDatetime: NSDate().timeIntervalSince1970)
```

Please check Tests,Example and [SuperMemo SM2 Algorithm](https://www.supermemo.com/english/ol/sm2.htm) page for the details of the algorithm.

## Contributions

Contributions are welcome! Feel free to submit a pull request.

## Credits
- [SuperMemo](https://www.supermemo.com/english/ol/sm2.htm) Explanation of Algorithm
- [LibSpacey](https://github.com/walterscarborough/LibSpacey) SM2 C++ Implemantation

## License

SMLib is released under the MIT license. [See LICENSE](https://github.com/tosbaha/SMLib/blob/master/LICENSE) for details.