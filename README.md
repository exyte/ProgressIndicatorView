<a href="https://exyte.com/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/header-dark.png"><img src="https://raw.githubusercontent.com/exyte/media/master/common/header-light.png"></picture></a>

<a href="https://exyte.com/"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/our-site-dark.png" width="80" height="16"><img src="https://raw.githubusercontent.com/exyte/media/master/common/our-site-light.png" width="80" height="16"></picture></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://twitter.com/exyteHQ"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/twitter-dark.png" width="74" height="16"><img src="https://raw.githubusercontent.com/exyte/media/master/common/twitter-light.png" width="74" height="16">
</picture></a> <a href="https://exyte.com/contacts"><picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/exyte/media/master/common/get-in-touch-dark.png" width="128" height="24" align="right"><img src="https://raw.githubusercontent.com/exyte/media/master/common/get-in-touch-light.png" width="128" height="24" align="right"></picture></a>


<img align="right" src="https://raw.githubusercontent.com/exyte/media/master/ProgressIndicatorView/demo.gif" width="250" />

<p><h1 align="left">ProgressIndicatorView</h1></p>

<p><h4>A number of preset progress indicators created with SwiftUI</h4></p>

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fexyte%2FProgressIndicatorView%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/exyte/ProgressIndicatorView)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fexyte%2FProgressIndicatorView%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/exyte/ProgressIndicatorView)
[![SPM Compatible](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen.svg)](https://swiftpackageindex.com/exyte/ProgressIndicatorView)
[![Cocoapods Compatible](https://img.shields.io/badge/cocoapods-Compatible-brightgreen.svg)](https://cocoapods.org/pods/ProgressIndicatorView)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License: MIT](https://img.shields.io/badge/License-MIT-black.svg)](https://opensource.org/licenses/MIT)

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

To try out the ProgressIndicatorView examples:
- Clone the repo `git clone git@github.com:exyte/ProgressIndicatorView.git`
- Open terminal and run `cd <ProgressIndicatorViewRepo>/Example`
- Run `pod install` to install all dependencies
- Run `xed .` to open project in the Xcode
- Try it!

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/exyte/ProgressIndicatorView.git", from: "0.0.1")
]
```

### CocoaPods

```ruby
pod 'ProgressIndicatorView'
```

### Carthage

```ogdl
github "Exyte/ProgressIndicatorView"
```

## Requirements

* iOS 13+ / watchOS 6+ / tvOS 13+ / macOS 10.15+
* Xcode 11+

## Our other open source SwiftUI libraries
[PopupView](https://github.com/exyte/PopupView) - Toasts and popups library    
[Grid](https://github.com/exyte/Grid) - The most powerful Grid container    
[ScalingHeaderScrollView](https://github.com/exyte/ScalingHeaderScrollView) - A scroll view with a sticky header which shrinks as you scroll  
[AnimatedTabBar](https://github.com/exyte/AnimatedTabBar) - A tabbar with number of preset animations         
[MediaPicker](https://github.com/exyte/mediapicker) - Customizable media picker     
[Chat](https://github.com/exyte/chat) - Chat UI framework with fully customizable message cells, input view, and a built-in media picker      
[ConcentricOnboarding](https://github.com/exyte/ConcentricOnboarding) - Animated onboarding flow    
[FloatingButton](https://github.com/exyte/FloatingButton) - Floating button menu    
[ActivityIndicatorView](https://github.com/exyte/ActivityIndicatorView) - A number of animated loading indicators      
[SVGView](https://github.com/exyte/SVGView) - SVG parser    
[LiquidSwipe](https://github.com/exyte/LiquidSwipe) - Liquid navigation animation    
