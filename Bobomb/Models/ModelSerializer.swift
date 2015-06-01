//
//  ModelSerializer.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

struct ModelSerializer<T: JSONSerializable> {
    
    static func modelFromDictionary(dictionary: NSDictionary) -> T? {
        return T(dictionary: dictionary)
    }
    
    static func modelsFromArray(array: [NSDictionary]) -> [T]? {
        var models = [T]()
        
        for json in array {
            if let result = T(dictionary: json) {
                models.append(result)
            }
        }
        
        return models
    }
}
