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
        return
            responseJSON { json in
                if let payload = JSONDecoder<Payload<Game>>.decode(json) {
                    return self.handlePayload(payload, handler: handler)
                    
                } else {
                    return .Failure(ResponseError.FailedToDecodeJSON)
                }
                
            }
            .updateUI { value in
                if let value = value as? Payload<Game> {
                    handler(value)
                }
            }
    }
    
    public func handlePayload<T>(payload: Payload<T>, handler: (Payload<T>) -> Void) -> ServiceTaskResult {
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

