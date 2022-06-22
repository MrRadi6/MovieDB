//
//  BaseRouter.swift
//  Moviedb
//
//  Created by Samir on 6/20/22.
//

import Alamofire

protocol BaseReqeust: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

extension BaseReqeust {
    func asURLRequest() throws -> URLRequest {
        let currentLanguage = LanguageManager().getCurrentAppLanguage().rawValue
        let queryItems = [URLQueryItem(name: Network.Parameter.language, value: currentLanguage)]

        var url = try Network.URL.baseUrl.asURL()
        url = url.appendingPathComponent(path)
        var urlComponents = URLComponents(string: url.absoluteString)
        urlComponents?.queryItems = queryItems
        if let fullUrl = urlComponents?.url {
            url = fullUrl
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 20
        urlRequest.headers = getHTTPHeaders()
        
        var encoding: ParameterEncoding

        if let parameters = parameters {
            if method == .get {
                encoding = URLEncoding.default
            } else {
                encoding = JSONEncoding.default
            }
            do {
                urlRequest = try encoding.encode(urlRequest, with: parameters)
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }

    private func getHTTPHeaders() -> HTTPHeaders {
        var headers: HTTPHeaders = HTTPHeaders()
        headers.add(.contentType(Network.ContentType.json))
        headers.add(.accept(Network.ContentType.json))
        return headers
    }
}
