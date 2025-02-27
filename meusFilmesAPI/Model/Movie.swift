//
//  Movie.swift
//  meusFilmesAPI
//
//  Created by Jean Ramalho on 27/02/25.
//
import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String
    
    var posterURL: URL? {
        return URL(string: "https://image.tmdb.org/t/p/w500\(poster_path)")
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}
