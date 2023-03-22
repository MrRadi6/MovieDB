//
//  MoviesRouter.swift
//  Moviedb
//
//  Created by Samir on 6/20/22.
//

import Alamofire

enum MoviesRequest: BaseReqeust {
    case popular(page: Int)
    case topRated(page: Int)
    case movies(page: Int)
    case details(id: Int)

    var method: HTTPMethod {
        switch self {
        case .popular, .topRated, .movies, .details:
            return .get
        }
    }

    var path: String {
        switch self {
        case .popular:
            return "\(Path.movie)/\(EndPoint.popular)"
        case .topRated:
            return "\(Path.movie)/\(EndPoint.topRated)"
        case .movies:
            return "\(Path.discover)/\(EndPoint.movie)"
        case .details(let id):
            return "\(Path.movie)/\(id)"
        }
    }

    var parameters: Parameters? {
        switch self {
        case .popular(let page):
            return [Parameter.page: page]
        case .topRated(let page):
            return [Parameter.page: page]
        case .movies(page: let page):
            return [Parameter.page: page]
        case .details:
            return nil
        }
    }
}

// MARK: - Constants
extension MoviesRequest {
    enum Path {
        static let movie = "movie"
        static let discover = "discover"
    }

    enum EndPoint {
        static let movie = "movie"
        static let popular = "popular"
        static let topRated = "top_rated"
    }

    enum Parameter {
        static let page = "page"
    }
}
