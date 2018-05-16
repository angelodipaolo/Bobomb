//
//  Payload.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 6/20/15.
//  Copyright © 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

public struct Payload<T: Codable>: Codable {
    public let version: String
    public let limit: Int
    public let offset: Int
    public let numberOfPageResults: Int
    public let numberOfTotalResults: Int
    public let statusCode: Int
    public let error: String
    public let results: [T]
    
    enum CodingKeys: String, CodingKey {
        case error = "error"
        case version = "version"
        case limit = "limit"
        case offset = "offset"
        case statusCode = "status_code"
        case numberOfPageResults = "number_of_page_results"
        case numberOfTotalResults = "number_of_total_results"
        case results = "results"
    }
}
