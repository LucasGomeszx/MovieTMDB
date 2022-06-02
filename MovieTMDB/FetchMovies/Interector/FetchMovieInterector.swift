//
//  FetchMovieInterector.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 31/05/22.
//

import SwiftUI
import Combine

class FetchMovieInterector {
    
    private let remote: FetchRemoteDataSource = .shered
    
    
    func buscarFilmes(fetch: String) -> Future<MovieResponse, AppError>{
        return remote.buscarFilmes(fetch: fetch)
    }
    
}
