//
//  ServiceTask+PayloadRespondable.swift
//  Bobomb
//
//  Created by Angelo Di Paolo on 5/31/15.
//  Copyright (c) 2015 Angelo Di Paolo. All rights reserved.
//

import THGWebService

extension ServiceTask {
    
    public func payloadAsGameResults(handler: (Payload<GameResult>) -> Void) -> Self {
        return responseJSON { json in
            self.handlePayload(Payload<GameResult>(dictionary: json as? NSDictionary), handler: handler)
        }
    }
    
    public func handlePayload<T>(payload: Payload<T>?, handler: (Payload<T>) -> Void) {
        if let payload = payload {
            handler(payload)
        } else {
            self.result = Result(data: nil, response: nil, error: NSError.JSONSerializationError())
        }
    }
}
