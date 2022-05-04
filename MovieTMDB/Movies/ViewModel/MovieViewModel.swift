//
//  MovieViewModel.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    
    @Published var uiState: MovieUiState = .none
    
    func onAppear() {
        WebService.buscarFilmesPopulares(method: .get) { filmes in
            
        }
    }
    
}
