//
//  MovieResponse.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import Foundation

struct MovieResponse: Decodable {
    
    let page: Int
    let results: [Results]
    let totalResults: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey{
        case page
        case results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
    
}

struct Results: Decodable {
    
    let posterPath: String?
    let overview: String
    let releaseDate: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case overview
        case releaseDate = "release_date"
        case title
    }
    
}
