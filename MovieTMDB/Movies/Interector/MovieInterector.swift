//
//  MovieInterector.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 05/05/22.
//

import Foundation
import Combine
import SwiftUI

class MovieInterector {
    
    private let remote: MovieRemoteDataSource = .shered
    
}

extension MovieInterector {
    
    func buscarFilmesPopulares() -> Future<MovieResponse, AppError>{
        return remote.buscarFilmesPopulares()
    }
    
}
