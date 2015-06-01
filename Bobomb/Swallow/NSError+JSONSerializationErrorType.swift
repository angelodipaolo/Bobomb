//
//  NSError+JSONSerializationErrorType.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import Foundation

extension NSError: JSONSerializationErrorType {
    
    class func JSONSerializationError() -> NSError {
        return NSError(domain: "com.angelodipaolo.bobomb", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to serialize JSON"])
    }
}
