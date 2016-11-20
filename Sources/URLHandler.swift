//
//  URLHandler.swift
//  catwalk
//
//  Created by Thiago Lioy on 10/11/16.
//
//

import Foundation
import Cocoa
import HTTPClient
import File
import Axis

struct URLHandler {
    static func fetchJson(at url: String) {
        let contentNegotiation = ContentNegotiationMiddleware(
            mediaTypes: [.json, .urlEncodedForm], mode: .client)
        
        guard let response = try? Client.get(url, middleware:[contentNegotiation]),
              let json = response.content else {
            return
        }
        JSONHandler.handle(json: json)
    }
}


struct FileHandler {
    static func fetchJsonFile(from file: String) {
        let deadline = 5.seconds.fromNow()
        guard let file = try? File(path: file),
            let buffer = try? file.readAll(deadline: deadline),
            let json = try? JSONMapParser.parse(buffer) else {
            return
        }

        JSONHandler.handle(json: json)
    }
}

struct JSONHandler {

    static func handle(json: Map) {
        switch json {
        case .dictionary:
            print("dict")
        case .array:
            print("array")
        default:
            print("do nothing")
        }
    }
}


