//
//  MovieDetailsDTO.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import Foundation

struct MovieDetailsDTO: Decodable {
    let title: String
    let posterPath: String?
    let overview: String?
    let rating: Float
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case posterPath = "poster_path"
        case overview
        case rating = "vote_average"
        case releaseDate = "release_date"
    }
}

// MARK: - Transfer to domain
extension MovieDetailsDTO {
    func transferToMovieDetails() -> MovieDetails {
        return MovieDetails(title: title,
                            posterPath: posterPath,
                            overview: overview,
                            rating: rating,
                            releaseDate: releaseDate)
    }
}
