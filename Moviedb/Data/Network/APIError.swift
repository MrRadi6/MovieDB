//
//  APIError.swift
//  Moviedb
//
//  Created by Samir on 6/21/22.
//

import Foundation

struct APIError: Decodable {
    let message: String

    enum CodingKeys: String, CodingKey {
        case message = "status_message"
    }
}
