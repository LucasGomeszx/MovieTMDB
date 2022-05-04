//
//  SplashViewModel.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var UiState: SplashUiState = .none
    
    func onAppear() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.UiState = .goToMovieView
        }
    }
    
}

extension SplashViewModel {
    
    func goToMoivieView() -> some View{
        return SplashViewRouter.makeViewMovie()
    }
    
}
