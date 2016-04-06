//
//  ServiceTask+Payload.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import ELWebService
import MeeSeeks

extension ServiceTask {
    public func payloadAsGameResults(handler: (Payload<Game>) -> Void) -> Self {
        return responseJSON { json, response in
            if let payload = JSONDecoder<Payload<Game>>.decode(json) {
                handler(payload)
                return .Empty
            } else {
                return .Failure(ResponseError.FailedToDecodeJSON)
            }
        }
    }
    
    public func resultFromPayload<T>(payload: Payload<T>) -> ServiceTaskResult {
        if payload.error == "OK" {
            return .Value(Payload<T>)
        } else {
            return .Failure(ResponseError.ResourceFailure(message: payload.error))
        }
    }
}

enum ResponseError: ErrorType {
    case ResourceFailure(message: String)
    case FailedToDecodeJSON
}

