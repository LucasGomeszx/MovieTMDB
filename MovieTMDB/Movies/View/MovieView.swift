//
//  MovieView.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import SwiftUI

struct MovieView: View {
    
    @ObservedObject var viewModel: MovieViewModel
    
    var body: some View {
        ZStack{
            if  MovieUiState.loading == viewModel.uiState {
                ProgressView()
            }else {
                NavigationView{
                    ScrollView(showsIndicators: false) {
                        LazyVStack{
                            if case MovieUiState.fullList(let rows) = viewModel.uiState {
                                ForEach(Array(rows.enumerated()), id: \.offset) { index, row in
                                    MovieCardView(viewModel: row)
                                        .onAppear {
                                            if index == rows.count - 1 {
                                                viewModel.loadMoreMovies()
                                            }
                                        }
                                }
                            }
                        }
                    }
                    .navigationTitle("Filmes Populares")
                }
            }
        }.onAppear(perform: viewModel.onAppear)
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(viewModel: MovieViewModel(interector: MovieInterector()))
    }
}
