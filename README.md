# TechnologyAssessmentApp

Fetch NYTimes Api to show news.

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

![minio_SWIFT1](https://github.com/kshitijgodara/SampleProject/blob/master/01.png)


## Version

1.0

## Build and Runtime Requirements
+ Xcode 9.0 or later
+ iOS 10.0 or later
+ OS X v10.13 or later

##  1. Dependencies

We will be building this app using Xcode 9.0 with Swift 4.0. This app will also consume the NYTimes API Service  built to get news according to days.

* Xcode 9.0 
* Swift 4.0

##  2. Library Dependencies

* SDWebImage  (This library provides an async image downloader with cache support.)
* Reachablity (Provided by apple for network monitoring)
* SwiftLint   (A tool to enforce Swift style and conventions, loosely based on [GitHub's Swift Style Guide](https://github.com/github/swift-style-guide).)

## 3.  Written in Swift

This sample is written in Swift.vERSION of the sample are at the top level directory of this project in folders named TechnologyAssesmentAoo.

## Tools

- [CocoaPods](https://cocoapods.org/) - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.
- [SonarQube](https://github.com/Jintin/Swimat) - SonarQube provides the capability to not only show health of an application but also to highlight issues newly introduced. With a Quality Gate in place, you can fix the leak and therefore improve code quality systematically.
- [SwiftLint](https://github.com/realm/SwiftLint) - A tool to enforce Swift style and conventions.
- [Sonar-swift](https://github.com/Backelite/sonar-swift) - This is an open source initiative for Apple Swift language support in SonarQube.

## Design Patterns

- ### [MVC]

Model-View-Controller (MVC) is one of the building blocks of Cocoa and is undoubtedly the most-used design pattern of all. It classifies objects according to their general role in your application and encourages clean separation of code based on role.

![minio_SWIFT1]( https://koenig-media.raywenderlich.com/uploads/2013/07/mvc0.png)   

- ### [Facade]

The Facade design pattern provides a single interface to a complex subsystem. Instead of exposing the user to a set of classes and their APIs, you only expose one simple unified API.

![minio_SWIFT1](https://koenig-media.raywenderlich.com/uploads/2013/07/facade2.png)

- ### [Decorator]

The Decorator pattern dynamically adds behaviors and responsibilities to an object without modifying its code. It’s an alternative to subclassing where you modify a class’s behavior by wrapping it with another object.

In Swift there are two very common implementations of this pattern: Extensions and Delegation.

## Installation

* Installation by cloning the repository
* Go to working directory
* Open TechnologyAssessmentApp.xcworkspace
* use command + B or Product -> Build to build the project
* Press run icon in Xcode or command + R to run the project on Simulator

## Step to run the project from command-line

* Make sure command-line tools of Xcode is installed 
* Go to working Directory
* xcodebuild -scheme TechnologyAssessmentApp build -allowProvisioningUpdates


## Step to static code coverage 
* Open TechnologyAssessmentApp.xcworkspace
* use Command+Shift+B or Product+Analyze to analyze the project


# Step to execute test cases
* use Command+U or Product+Test to execute the test case

# Fastlane is used for CI
# Install fastlane through Terminal
# brew cask install fastlane
# export PATH="$HOME/.fastlane/bin:$PATH"

## Meta

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/yourname/github-link](https://github.com/dbader/)

[swift-image]:https://img.shields.io/badge/swift-4.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com

