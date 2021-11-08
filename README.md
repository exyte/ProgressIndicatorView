<img src="https://github.com/exyte/ProgressIndicatorView/blob/master/Assets/header.png">
<img align="right" src="https://raw.githubusercontent.com/exyte/ProgressIndicatorView/master/Assets/demo.gif" width="250" />

<p><h1 align="left">ProgressIndicatorView</h1></p>

<p><h4>A number of preset progress indicators created with SwiftUI</h4></p>

___

<p> We are a development agency building
  <a href="https://clutch.co/profile/exyte#review-731233">phenomenal</a> apps.</p>

</br>

<a href="https://exyte.com/contacts"><img src="https://i.imgur.com/vGjsQPt.png" width="134" height="34"></a> <a href="https://twitter.com/exyteHQ"><img src="https://i.imgur.com/DngwSn1.png" width="165" height="34"></a>

</br></br>
[![Travis CI](https://travis-ci.org/exyte/ProgressIndicatorView.svg?branch=master)](https://travis-ci.org/exyte/ProgressIndicatorView)
[![Version](https://img.shields.io/cocoapods/v/ProgressIndicatorView.svg?style=flat)](http://cocoapods.org/pods/ProgressIndicatorView)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-0473B3.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/ProgressIndicatorView.svg?style=flat)](http://cocoapods.org/pods/ProgressIndicatorView)
[![Platform](https://img.shields.io/cocoapods/p/ProgressIndicatorView.svg?style=flat)](http://cocoapods.org/pods/ProgressIndicatorView)
[![Twitter](https://img.shields.io/badge/Twitter-@exyteHQ-blue.svg?style=flat)](http://twitter.com/exyteHQ)

# Usage

Create a progress indicator like this:
   ```swift
   ProgressIndicatorView(isVisible: $showProgressIndicator, type: .bar(progress: $progress))
   ```
   where  
   `showProgressIndicator` - bool value you may change to display or hide the indicator  
   `type` - value from `ProgressIndicatorView.IndicatorType` enum  

You may alter it with standard SwiftUI means like this: 
   ```swift
   ProgressIndicatorView(isVisible: $showProgressIndicator, type: .bar(progress: $progress))
        .frame(width: 50.0, height: 50.0)
        .foregroundColor(.red)
   ```

### Indicator types
`default` - progress indicator looks like default iOS UIActivityIndicator.  
`bar` - line progress bar with a Binding<CGFloat> progress value and background color, default is `Color.clear`:
  ```swift
   ProgressIndicatorView(isVisible: $showProgressIndicator, type: .bar(progress: $progress, backgroundColor: .gray)
       .frame(height: 8.0)
       .foregroundColor(.red)
   ```
  
`impulseBar` - impulse line bar, works as `bar` indicator with an impulse effect.  
`dashBar` - discrete line bar, with number of pieces, default is 8:
   ```swift
     ProgressIndicatorView(isVisible: $showProgressIndicator, type: .dashBar(progress: $progress, numberOfItems: 8))
        .frame(height: 8.0)
        .foregroundColor(.red)
   ```
  
`circle` - cirle progress indicator, with `lineWidth` and `strokeColor`:
  ```swift
     ProgressIndicatorView(isVisible: $showProgressIndicator, type: .circle(progress: $progress, lineWidth: 8.0, strokeColor: .red))
        .frame(height: 8.0)
        .foregroundColor(.red)
   ```  


## Examples

To try out the ActivityIndicatorView examples:
- Clone the repo `git clone git@github.com:exyte/ProgressIndicatorView.git`
- Open terminal and run `cd <ProgressIndicatorViewRepo>/Example`
- Run `pod install` to install all dependencies
- Run `xed .` to open project in the Xcode
- Try it!

## Installation

### CocoaPods

```ruby
pod 'ProgressIndicatorView'
```

### Carthage

```ogdl
github "Exyte/ProgressIndicatorView"
```

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/exyte/ProgressIndicatorView.git", from: "0.0.1")
]
```

## Requirements

* iOS 15+ / watchOS 7+ / tvOS 14+ / macOS 11+
* Xcode 13+
