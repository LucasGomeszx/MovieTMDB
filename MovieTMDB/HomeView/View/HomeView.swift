//
//  HomeView.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 12/05/22.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            viewModel.moviesView()
                .tabItem {
                    Image(systemName: "film")
                    Text("Filmes Populares")
                }.tag(0)
            Text("fetchMovies")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Buscar Filme")
                }.tag(1)
        }
        .background(Color.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
