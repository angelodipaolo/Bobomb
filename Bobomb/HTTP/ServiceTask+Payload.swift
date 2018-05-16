//
//  ServiceTask+Payload.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import ELWebService

public enum Result<T: Codable> {
    case success(T)
    case failure(Error)
    
    init(error: Error) {
        self = .failure(error)
    }
    
    init(_ value: T) {
        self = .success(value)
    }
}

extension ServiceTask {
    public func payload<T>(handler: @escaping (Result<T>) -> Void) -> Self {
        return response { data, response in
            guard let data = data else {
                DispatchQueue.main.async {
                    handler(Result(error: ResponseError.FailedToDecodeJSON))
                }
                return .empty
            }
            
            let payload = try JSONDecoder().decode(T.self, from: data)

            DispatchQueue.main.async {
                handler(Result(payload))
            }
            
            return .empty
        }
        .responseError { error in
            DispatchQueue.main.async {
                handler(Result(error: error))
            }
        }
    }
}

enum ResponseError: Error {
    case ResourceFailure(message: String)
    case FailedToDecodeJSON
}

