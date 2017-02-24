# KVLoading

[![CI Status](http://img.shields.io/travis/vuvankhac/KVLoading.svg?style=flat)](https://travis-ci.org/vuvankhac/KVLoading)
[![Version](https://img.shields.io/cocoapods/v/KVLoading.svg?style=flat)](http://cocoapods.org/pods/KVLoading)
[![License](https://img.shields.io/cocoapods/l/KVLoading.svg?style=flat)](http://cocoapods.org/pods/KVLoading)
[![Platform](https://img.shields.io/cocoapods/p/KVLoading.svg?style=flat)](http://cocoapods.org/pods/KVLoading)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

<img src="Screenshots/KVLoading-default.gif" width="320px" height="568px" />
<img src="Screenshots/KVLoading-custom.gif" width="320px" height="568px" />

## Requirements

## Installation

KVLoading is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KVLoading', '~> 1.1'
```

## Usage

Show default loading:
```swift
KVLoading.show()
```

Show default loading without animation:
```swift
KVLoading.show(animated: false)
```

Show custom view loading:
```swift
let customView: UIView = UIView()
KVLoading.show(customView)
```

Show custom view loading without animation:
```swift
let customView: UIView = UIView()
KVLoading.show(customView, animated: false)
```

Hide loading view:
```swift
KVLoading.hide()
```

Hide loading view without animation:
```swift
KVLoading.hide(animated: false)
```

## Author

Vu Van Khac, khacvv0451@gmail.com <br />
My Facebook: https://www.facebook.com/khacvv0451  <br />
My Twitter: https://twitter.com/vuvankhac  <br />

## License

KVLoading is available under the MIT license. See the LICENSE file for more info.
