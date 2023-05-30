//
//  MovieResult.swift
//  SearchMovies
//
//  Created by Jadiê on 29/05/23.
//

import Foundation

struct MovieResult {
    let Search: [Movie]
}

struct Movie {
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String
    
    private enum CodingKeys: String, CodingKey {
//        case Title, Year, imdbID, _Type = "Type", Poster
        case _Type = "Type"
    }
}
