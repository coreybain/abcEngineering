![abcbanner](https://user-images.githubusercontent.com/2592956/51564808-61945a80-1ee4-11e9-85df-9a33f862c56f.png)

[![Build Status](https://travis-ci.org/coreybain/abcEngineering.svg?branch=master)](https://travis-ci.org/coreybain/abcEngineering)\
[![Twitter](https://img.shields.io/badge/twitter-@Coreybaines-blue.svg?style=flat)](https://twitter.com/coreybaines)
[![Website](https://img.shields.io/badge/website-spiritdevs-green.svg?style=flat)](https://spiritdevs.com)

ABCEngineering is a sample challenge to display stages ABC News articles with an in-app WebKit view.

- [Features](#features)
- [Component Libraries](#component-libraries)
- [FAQ](#faq)
- [Credits](#credits)
- [License](#license)

## Features

- [x] App theme change to semi-resemble the ABC News app
- [x] Refactoring of code and reorganisation of folders for visibility
- [x] Addition of ABCWebKit framework for in-app safari use
- [x] Introduction of a navigation controller to assist in segues
- [x] Use of both programatic and IB (Interface Builder) based ui’s
- [x] Xctest’s for both function testing and ui testing

## Component Libraries

As part of the challenge ABCEngineering incorporates a custom framework for creating a WebKit programatically and displaying the link associated with the article you tapped.

- [ABCWebView](https://github.com/coreybain/abcWebView) - A custom WebKit framework for displaying links from any service. In ABCEngineerings case, when an article is click it sends the link and the webview renders it with controls.

## Requirements

- iOS 10.0+ 
- Xcode 10.1+
- Swift 4.2+

## FAQ

### How do I turn this framework into a cocoapod?

While the coding challenge in this case was meant to be limited to 1 hour, I did go over a little but wanted to try and keep it within a 2 hour timeframe. One of the cuts I decided to make was to use a framework in preference to a full on Cocoapod. This was also in part a consideration given the simplicity of the app and how as far as the app is concerned a framework acts in the same was as a Cocoapod. 
However if anyone did want to convert the framework linked here: to a Cocoapod please use this tutorial to assist you -> .

## Credits

ABC Engineering are the builders and sole owners of all code written here...

## License

Contact ABC for licence information.
