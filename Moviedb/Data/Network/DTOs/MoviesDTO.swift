//
//  MoviesDTO.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import Foundation

struct MoviesDTO: Decodable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let movies: [MovieDTO]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movies = "results"
    }
}

struct MovieDTO: Decodable {
    let id: Int
    let title: String
    let posterPath: String?
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case title = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

// MARK: - Transfer to domain
extension MoviesDTO {
    func transferToMoviesPage() -> MoviesPage {
        return MoviesPage(number: page,
                          totalResults: totalResults,
                          totalPages: totalPages,
                          movies: movies.map({ $0.transferToMovie() }))
    }
}

extension MovieDTO {
    func transferToMovie() -> Movie {
        var path: String?
        if let posterPath = posterPath {
            path = Network.URL.image + posterPath
        }
        return Movie(id: id,
                     title: title,
                     posterPath: path,
                     releaseDate: DateManager.getDateFromAPI(string: releaseDate))
    }
}

