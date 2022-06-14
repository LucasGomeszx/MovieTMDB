//
//  FetchMovieViewModel.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 30/05/22.
//

import SwiftUI
import Combine

class FetchMovieViewModel: ObservableObject {
    
    @Published var uiState: FetchMoviesUiState = .loading
    private var interector: FetchMovieInterector
    private var cancelableFetch: AnyCancellable?
    
    init(interector: FetchMovieInterector){
        self.interector = interector
    }
    
    @Published var filme = "" {
        didSet {
            buscarFilmes(fetch: filme)
        }
    }
    
    func buscarFilmes(fetch: String){
        cancelableFetch = interector.buscarFilmes(fetch: fetch)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                
            }, receiveValue: { response in
                self.uiState = .fullList(
                    response.results.map{
                        return MovieCardViewModel(id: $0.id, title: $0.title, poster: $0.posterPath, desc: $0.overview, data: $0.releaseDate ?? "")
                    }
                )
            })
    }
    
}
