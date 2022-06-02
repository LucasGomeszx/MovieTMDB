//
//  FetchMoviesView.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 30/05/22.
//

import SwiftUI

struct FetchMoviesView: View {
    
    @ObservedObject var viewModel: FetchMovieViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                
                TextField("Digite o nome de um filme", text: $viewModel.filme)
                    .padding()
                    .border(.orange)
                
                Spacer()
                
                ScrollView{
                    if case FetchMoviesUiState.fullList(let row) = viewModel.uiState {
                        ForEach(row){ row in
                            MovieCardView(viewModel: row)
                        }
                    }
                }
                
            }
            .navigationTitle("Buscar Filmes")
        }
    }
}

struct FetchMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        FetchMoviesView(viewModel: FetchMovieViewModel(interector: FetchMovieInterector()))
    }
}
