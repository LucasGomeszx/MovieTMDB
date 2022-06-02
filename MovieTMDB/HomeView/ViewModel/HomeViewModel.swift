//
//  HomeViewModel.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 12/05/22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    let movieViewModel = MovieViewModel(interector: MovieInterector())
    let fetchViewModel = FetchMovieViewModel(interector: FetchMovieInterector())
    
}

extension HomeViewModel {
    
    func moviesView() -> some View {
        return HomeViewRouter.makeMoviewView(viewModel: movieViewModel)
    }
    
    func fetchMovieView() -> some View {
        return HomeViewRouter.makeFetchMovieView(viewModel: fetchViewModel)
    }
    
}
