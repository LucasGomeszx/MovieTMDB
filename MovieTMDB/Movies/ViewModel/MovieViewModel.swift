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
    private var concelableRequest: AnyCancellable?
    
    init(interector: MovieInterector){
        self.interector = interector
    }
    
    deinit{
        concelableRequest?.cancel()
    }
    
    func onAppear() {
        concelableRequest = interector.buscarFilmesPopulares()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {completion in
                
            }, receiveValue: {response in
                self.uiState = .fullList(
                    response.results.map {
                        
                        return MovieCardViewModel(id: $0.id,title: $0.title, poster: $0.posterPath, desc: $0.overview, data: $0.releaseDate)
                    }
                )
            })
        
    }
}
