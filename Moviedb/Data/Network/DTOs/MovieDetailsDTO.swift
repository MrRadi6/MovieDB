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
    let totalVotes: Int

    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case posterPath = "poster_path"
        case overview
        case rating = "vote_average"
        case releaseDate = "release_date"
        case totalVotes = "vote_count"
    }
}

// MARK: - Transfer to domain
extension MovieDetailsDTO {
    func transferToMovieDetails() -> MovieDetails {
        var path: String?
        if let posterPath = posterPath {
            path = Network.URL.image + posterPath
        }
        return MovieDetails(title: title,
                            posterPath: path,
                            overview: overview,
                            rating: rating,
                            totalVotes: totalVotes,
                            releaseDate: DateManager.getDateFromAPI(string: releaseDate))
    }
}
