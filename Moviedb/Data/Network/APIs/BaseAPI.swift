//
//  BaseAPI.swift
//  Moviedb
//
//  Created by Samir on 6/21/22.
//

import Alamofire

protocol BaseAPI {
    func makeAuthRequest<T: Decodable>(request: URLRequestConvertible,
                                       completion: @escaping (Result<T, BaseError>) -> Void)
}

extension BaseAPI {
    func makeAuthRequest<T: Decodable>(request: URLRequestConvertible,
                                       completion: @escaping (Result<T, BaseError>) -> Void) {
        let repository = AuthRepository(storage: UserStorage())
        AF.request(request, interceptor: AuthInterceptor(repository: repository))
            .validate()
            .validate(contentType: [Network.ContentType.json])
            .response { response in
                if let requestURL = response.request?.url?.absoluteString {
                    dLog("Request - \(requestURL)")
                }
                switch response.result {
                case .success(let data):
                    if let data = data {
                        do {
                            let value = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(value))
                        } catch {
                            dLog(error)
                            completion(.failure(.unknown))
                        }

                    } else {
                        completion(.failure(.unknown))
                    }
                case .failure(let error):
                    if let data = response.data,
                       let responseError = try? JSONDecoder().decode(APIError.self, from: data) {
                        completion(.failure(.systemError(message: responseError.message)))
                    } else {
                        dLog(error)
                        completion(.failure(.unknown))
                    }
                }
            }
    }
}
