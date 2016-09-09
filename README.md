# Bobomb 

[![Version](https://img.shields.io/badge/version-v1.1.0-blue.svg)](https://github.com/angelodipaolo/Bobomb/releases/latest)
[![Build Status](https://travis-ci.org/angelodipaolo/Bobomb.svg?branch=master)](https://travis-ci.org/angelodipaolo/Bobomb)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

![logo](https://github.com/angelodipaolo/Bobomb/blob/master/logo.jpg)

Bobomb is a Swift framework that makes it easy for iOS apps to communicate with the [GiantBomb API](http://www.giantbomb.com/api/).

**NOTE: This is a work in progress**. Many of GiantBomb API endpoints are not yet supported.

## Requirements

Bobomb requires Swift 2.3 and Xcode 8. Bobomb depends on the [ELWebService](https://github.com/Electrode-iOS/ELWebService) and [MeeSeeks](https://github.com/angelodipaolo/MeeSeeks) frameworks.

## Installation

### Carthage

Install with [Carthage](https://github.com/Carthage/Carthage) by adding the framework to your project's [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

```
github "angelodipaolo/Bobomb" ~> v1.1.0
```

## Usage

```
import Bobomb

let client = GiantBombClient(apiKey: "12345")
        
client.searchGamesWithQuery("metroid") { (payload: Payload<Game>) in
    for game in payload.results {
        print(game.name)
    }
}
.updateErrorUI { error in
    print("error = \(error)")
    // handle response error
}
```
