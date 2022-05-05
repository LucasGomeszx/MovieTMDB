//
//  MovieInterector.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 05/05/22.
//

import Foundation
import Combine

class MovieInterector {
    
    private let remote: MovieRemoteDataSource = .shered
    
}

extension MovieInterector {
    
    func buscarFilmesPopulares() -> Future<[Results], AppError>{
        return remote.buscarFilmesPopulares()
    }
    
}
