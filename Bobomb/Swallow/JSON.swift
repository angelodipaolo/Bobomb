//
//  JSON.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

public protocol JSONSerializable {
    init?(dictionary: NSDictionary)
}

public protocol JSONRespondable {
    func responseAs<T: JSONSerializable>(handler: (T) -> Void) -> Self
}

public protocol JSONArrayRespondable {
    func responseAsArrayOf<T: JSONSerializable>(handler: ([T]) -> Void) -> Self
}

public protocol JSONSerializationErrorType {}
