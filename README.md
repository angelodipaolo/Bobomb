# Bobomb 

![logo](https://github.com/angelodipaolo/Bobomb/blob/master/logo.jpg)

GiantBomb API client for Swift.

## Usage

```
import Bobomb

GiantBombClient(apiKey: "12345")
    .searchGamesWithQuery("metroid")
    .payloadAsGameResults { payload in
        for game in payload.results {
            println(game.name)
        }
    }
    .responseError { error in
        println(error)
    }

```
