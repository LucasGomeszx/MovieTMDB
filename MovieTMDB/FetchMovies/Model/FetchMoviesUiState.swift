//
//  FetchMovies.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 30/05/22.
//

import SwiftUI

enum FetchMoviesUiState: Equatable {
    
    case loading
    case emptyList
    case fullList([MovieCardViewModel])
    
}
