//
//  AuthInterceptor.swift
//  Moviedb
//
//  Created by Samir on 6/21/22.
//

import Alamofire

final class AuthInterceptor: RequestInterceptor {

    let repository: AuthRepository

    init(repository: AuthRepository) {
        self.repository = repository
    }

    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        if let url = request.url {
            let queryItems = [URLQueryItem(name: Parameter.apiKey, value: repository.getUserToken())]
            var urlComponents = URLComponents(string: url.absoluteString)
            urlComponents?.queryItems = queryItems
            request.url = urlComponents?.url
        }
        completion(.success(request))
    }
}

// MARK: - Constants
extension AuthInterceptor {
    enum Parameter {
        static let apiKey = "api_key"
    }
}
