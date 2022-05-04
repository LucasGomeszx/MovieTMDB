//
//  ContentView.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 03/05/22.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group{
            switch viewModel.UiState{
            case .none:
                Text("SplashView")
            case .goToMovieView:
                Text("Mudar para movie View")
            }
        }.onAppear(perform: viewModel.onAppear)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(viewModel: SplashViewModel())
    }
}
