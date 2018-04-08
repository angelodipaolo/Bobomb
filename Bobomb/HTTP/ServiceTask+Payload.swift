//
//  ServiceTask+Payload.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import ELWebService
import MeeSeeks

public enum Result<T: JSONDecodable> {
    case success(Payload<T>)
    case failure(Error)
    
    init(error: Error) {
        self = .failure(error)
    }
    
    init(_ value: Payload<T>) {
        self = .success(value)
    }
}

extension ServiceTask {
    public func payload<T>(handler: @escaping (Result<T>) -> Void) -> Self {
        return responseJSON { json, response in
            guard let payloadJSON = json as? [String: Any] else {
                handler(Result(error: ResponseError.FailedToDecodeJSON))
                return .empty
            }
            guard let payload = try MeeSeeks.JSONDecoder<Payload<T>>.decode(json: payloadJSON) else {
                handler(Result(error: ResponseError.FailedToDecodeJSON))
                return .empty
            }
            
            DispatchQueue.main.async {
                handler(Result(payload))
            }
            
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

