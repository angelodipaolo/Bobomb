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
    public func payloadAsGameResults(handler: @escaping (Payload<Game>) -> Void) -> Self {
        return responseJSON { json, response in
            guard let gameJSON = json as? [String: Any] else {
                throw ResponseError.FailedToDecodeJSON
            }
            guard let payload = try JSONDecoder<Payload<Game>>.decode(json: gameJSON) else {
                throw ResponseError.FailedToDecodeJSON
            }
            
            handler(payload)
            return .empty
        }
    }
    
    public func resultFromPayload<T>(payload: Payload<T>) -> ServiceTaskResult {
        if payload.error == "OK" {
            return .value(Payload<T>.self)
        } else {
            return .failure(ResponseError.ResourceFailure(message: payload.error))
        }
    }
}

enum ResponseError: Error {
    case ResourceFailure(message: String)
    case FailedToDecodeJSON
}

