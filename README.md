# Bobomb 

[![Build Status](https://travis-ci.org/angelodipaolo/Bobomb.svg?branch=master)](https://travis-ci.org/angelodipaolo/Bobomb)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

![logo](https://github.com/angelodipaolo/Bobomb/blob/master/logo.jpg)

Bobomb is a Swift framework that makes it easy for iOS apps to communicate with the [GiantBomb API](http://www.giantbomb.com/api/).

**NOTE: This is a work in progress**. Many of GiantBomb API endpoints are not yet supported.

## Requirements

Bobomb requires Swift 4.1 and Xcode 9.3.

## Installation

### Carthage

Install with [Carthage](https://github.com/Carthage/Carthage) by adding the framework to your project's [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

```
github "angelodipaolo/Bobomb"
```

## Usage

```
import Bobomb

let client = GiantBombClient(apiKey: "12345")
        
client.searchGames(query: "metroid") { (payload: Result<Game>) in
    switch result {
    case .success(let payload):
        for game in payload.results {
            print(game.name)
        }
    case .failure(let error):
        print("error = \(error)")
    }
}
```
