//
//  Payload.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

public struct Payload<T: protocol<BobombResource, JSONSerializable>> {
    public let version: String
    public let limit: Int
    public let offset: Int
    public let numberOfPageResults: Int
    public let numberOfTotalResults: Int
    public let statusCode: Int
    public let error: String
    public let results: [T]
}

// MARK: - JSON Serialization

extension Payload: JSONSerializable {
    
    public init?(dictionary: NSDictionary) {
        if let error                 = dictionary["error"] as? String,
            let version              = dictionary["version"] as? String,
            let limit                = dictionary["limit"] as? Int,
            let offset               = dictionary["offset"] as? Int,
            let statusCode           = dictionary["status_code"] as? Int,
            let numberOfPageResults  = dictionary["number_of_page_results"] as? Int,
            let numberOfTotalResults = dictionary["number_of_total_results"] as? Int,
            let resultArray = dictionary["results"] as? [NSDictionary],
            let results = ModelSerializer<T>.modelsFromArray(resultArray) {
                
                self.version = version
                self.error = error
                self.limit = limit
                self.statusCode = statusCode
                self.offset = offset
                self.numberOfPageResults = numberOfPageResults
                self.numberOfTotalResults = numberOfTotalResults
                self.results = results
        } else {
            return nil
        }
    }
    
    public init?(dictionary: NSDictionary?) {
        if let dictionary = dictionary {
            self.init(dictionary: dictionary)
        } else {
            return nil
        }
    }
}
