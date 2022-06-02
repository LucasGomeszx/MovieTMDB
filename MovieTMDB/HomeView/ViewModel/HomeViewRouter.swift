//
//  HomeViewRouter.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 12/05/22.
//

import Foundation
import SwiftUI

class HomeViewRouter {
    
    static func makeMoviewView(viewModel: MovieViewModel) -> some View {
        return MovieView(viewModel: viewModel)
    }
    
    static func makeFetchMovieView(viewModel: FetchMovieViewModel) -> some View {
        return FetchMoviesView(viewModel: viewModel)
    }
    
}
