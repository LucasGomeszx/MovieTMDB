//
//  MovieViewModel.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import SwiftUI
import Combine

class MovieViewModel: ObservableObject {
    
    @Published var uiState: MovieUiState = .loading
    
    private let interector: MovieInterector
    private var concelableRequest: AnyCancellable?
    var filmes: [MovieCardViewModel] = []
    
    init(interector: MovieInterector){
        self.interector = interector
    }
    
    deinit{
        concelableRequest?.cancel()
    }
    
    func onAppear() {
        
        self.uiState = .loading
        
        concelableRequest = interector.buscarFilmesPopulares()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {completion in
                
            }, receiveValue: {response in
                response.results.map {
                    self.filmes.append(MovieCardViewModel(id: $0.id,title: $0.title, poster: $0.posterPath, desc: $0.overview, data: $0.releaseDate ?? ""))
                }
                self.uiState = .fullList(self.filmes)
            })
    }
    
    func loadMoreMovies(){
        concelableRequest = interector.buscarFilmesPopulares()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {completion in
                
            }, receiveValue: {response in
                response.results.map {
                    self.filmes.append(MovieCardViewModel(id: $0.id,title: $0.title, poster: $0.posterPath, desc: $0.overview, data: $0.releaseDate ?? ""))
                }
                print(self.filmes.count)
                self.uiState = .fullList(self.filmes)
            })
    }
}
