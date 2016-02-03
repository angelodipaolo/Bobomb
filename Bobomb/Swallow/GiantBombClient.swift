//
//  GiantBombClient.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/30/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import ELWebService

public protocol GiantBombAPI {
    var apiKey: String {get}
    
    init(apiKey: String)
    
    func searchWithQuery(query: String, completion: (Payload<Game>) -> Void) -> ServiceTask
    func searchGamesWithQuery(query: String, completion: (Payload<Game>) -> Void) -> ServiceTask
}

extension GiantBombAPI {
    var defaultParameters: [String: AnyObject] {
        return ["api_key" : apiKey, "format": "json"]
    }
}

public final class GiantBombClient: GiantBombAPI {
    public static let baseURL = "http://www.giantbomb.com/"
    public let apiKey: String
    private let webService = WebService(baseURLString: baseURL)
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
}

// MARK: - Resources

extension GiantBombClient {
    public func searchWithQuery(query: String, completion: (Payload<Game>) -> Void) -> ServiceTask {
        var parameters = defaultParameters
        parameters["query"] = query
        
        return webService
            .GET("/api/search")
            .setParameters(parameters)
            .payloadAsGameResults { payload in
                completion(payload)
            }
    }
    
    public func searchGamesWithQuery(query: String, completion: (Payload<Game>) -> Void) -> ServiceTask {
        var parameters = defaultParameters
        parameters["resources"] = "game"
        parameters["query"] = query
        
        return webService
            .GET("/api/search")
            .setParameters(parameters)
            .payloadAsGameResults { payload in
                completion(payload)
            }
        
    }
    
    public func fetchGame(gameID: Int) -> ServiceTask {
        return webService
            .GET("/api/game/\(gameID)")
            .setParameters(defaultParameters)
    }
    
    public func fetchPlatform(platformID: Int) -> ServiceTask {
        return webService
            .GET("/api/platform/\(platformID)")
            .setParameters(defaultParameters)
    }
}
