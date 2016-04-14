# Bobomb 

![logo](https://github.com/angelodipaolo/Bobomb/blob/master/logo.jpg)

Bobomb is a Swift framework that makes it easy for iOS apps to communicate with the [GiantBomb API](http://www.giantbomb.com/api/).

**NOTE: This is a work in progress**. Many of GiantBomb API endpoints are not yet supported.

## Requirements

Bobomb requires Swift 2.2 and Xcode 7.3. Bobomb depends on the [ELWebService](https://github.com/Electrode-iOS/ELWebService) and [MeeSeeks](https://github.com/angelodipaolo/MeeSeeks) frameworks.

## Installation

### Carthage

Install with [Carthage](https://github.com/Carthage/Carthage) by adding the framework to your project's [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

```
github "angelodipaolo/Bobomb" ~> v1.0.2
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
