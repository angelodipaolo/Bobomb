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
    
    func search(query: String, completion: @escaping (Result<Payload<Game>>) -> Void) -> ServiceTask
    func searchGames(query: String, completion: @escaping (Result<Payload<Game>>) -> Void) -> ServiceTask
}

extension GiantBombAPI {
    var defaultParameters: [String: Any] {
        return ["api_key" : apiKey, "format": "json"]
    }
}

public final class GiantBombClient: GiantBombAPI {
    public static let baseURL = "https://www.giantbomb.com/"
    public let apiKey: String
    fileprivate let webService = WebService(baseURLString: baseURL)
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
}

// MARK: - Resources

extension GiantBombClient {
    @discardableResult public func search(query: String, completion: @escaping (Result<Payload<Game>>) -> Void) -> ServiceTask {
        var parameters = defaultParameters
        parameters["query"] = query
        
        return webService
            .GET("/api/search")
            .setParameters(parameters)
            .payload(handler: completion)
            .resume()
    }
    
    @discardableResult public func searchGames(query: String, completion: @escaping (Result<Payload<Game>>) -> Void) -> ServiceTask {
        var parameters = defaultParameters
        parameters["resources"] = "game"
        parameters["query"] = query
        
        return webService
            .GET("/api/search")
            .setParameters(parameters)
            .payload(handler: completion)
            .resume()
        
    }
    
    @discardableResult public func fetch(gameID: Int) -> ServiceTask {
        return webService
            .GET("/api/game/\(gameID)")
            .setParameters(defaultParameters)
            .resume()
    }
    
    @discardableResult public func fetch(platformID: Int) -> ServiceTask {
        return webService
            .GET("/api/platform/\(platformID)")
            .setParameters(defaultParameters)
            .resume()
    }
}
