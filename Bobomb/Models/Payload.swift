//
//  Payload.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 6/20/15.
//  Copyright © 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation
import MeeSeeks

public struct Payload<T: JSONDecodable> {
    public let version: String
    public let limit: Int
    public let offset: Int
    public let numberOfPageResults: Int
    public let numberOfTotalResults: Int
    public let statusCode: Int
    public let error: String
    public let results: [T]
}

extension Payload: JSONDecodable {
    public init?(json: [String : Any]) throws {
        guard
            let error                = json["error"] as? String,
            let version              = json["version"] as? String,
            let limit                = json["limit"] as? Int,
            let offset               = json["offset"] as? Int,
            let statusCode           = json["status_code"] as? Int,
            let numberOfPageResults  = json["number_of_page_results"] as? Int,
            let numberOfTotalResults = json["number_of_total_results"] as? Int,
        let resultArray = json["results"] as? [[String: Any]],
            let results = try JSONDecoder<T>.decode(jsonArray: resultArray)
        else { return nil }
        
        self.version = version
        self.error = error
        self.limit = limit
        self.statusCode = statusCode
        self.offset = offset
        self.numberOfPageResults = numberOfPageResults
        self.numberOfTotalResults = numberOfTotalResults
        self.results = results
    }
}
