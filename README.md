# Bobomb 

![logo](https://github.com/angelodipaolo/Bobomb/blob/master/logo.jpg)

GiantBomb API client for Swift.

## Requirements

Bobomb requires Swift 2.2 and Xcode 7.2. Bobomb depends on the [ELWebService](https://github.com/Electrode-iOS/ELWebService) and [MeeSeeks](https://github.com/angelodipaolo/MeeSeeks) frameworks.

## Installation

### Carthage

Install with [Carthage](https://github.com/Carthage/Carthage) by adding the framework to your project's [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).

```
github "angelodipaolo/Bobomb" ~> v1.0.1
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
