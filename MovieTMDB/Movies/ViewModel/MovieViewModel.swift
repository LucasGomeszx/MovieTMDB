//
//  MovieViewModel.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import SwiftUI
import Combine

class MovieViewModel: ObservableObject {
    
    @Published var uiState: MovieUiState = .none
    
    private let interector: MovieInterector
    
    init(interector: MovieInterector){
        self.interector = interector
    }
    
    func onAppear() {
        interector.buscarFilmesPopulares()
            .receive(on: DispatchQueue.main)
            .sink { error in
                
            } receiveValue: { filmes in
                
            }

    }
    
}
