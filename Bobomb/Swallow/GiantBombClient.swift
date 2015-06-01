//
//  GiantBombClient.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/30/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import THGWebService

public struct GiantBombClient {
    
    static let baseURL = "http://www.giantbomb.com/"
    let apiKey: String
    private var defaultParameters: [String: AnyObject] {
        return ["api_key" : apiKey, "format": "json"]
    }
    
    let webService = WebService(baseURLString: baseURL)
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
}

extension GiantBombClient {
    
    public func searchGamesWithQuery(query: String) -> ServiceTask {
        
        var parameters = defaultParameters
        parameters["resources"] = "game"
        parameters["query"] = query
        
        return webService.GET("/api/search", parameters: parameters)
    }
    
    public func fetchGame(gameID: String) -> ServiceTask {
        return webService.GET("/api/game/\(gameID)", parameters: defaultParameters)
    }
}
