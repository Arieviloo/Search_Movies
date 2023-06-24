//
//  MovieResult.swift
//  SearchMovies
//
//  Created by Jadiê on 29/05/23.
//

import Foundation

//struct MovieResult: Codable {
//    let Search: [Movie]
//
//}

//struct Movie: Codable {
//    let Title: String
//    let Year: String
//    let imdbID: String
//    let _Type: `String`
//    let Poster: String
//
//    private enum CodingKeys: String, CodingKey {
//        case Title, Year, imdbID, _Type = "Type", Poster
//
//    }
//}


struct MoviesPage: Decodable {
    let page: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
    }
}

struct Movie:Decodable {

    let title: String
    let overview: String
    let imgMovie: String
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case imgMovie = "poster_path"
        
    }
}
