//
//  SplashViewRouter.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeViewMovie() -> some View {
        return HomeView(viewModel: HomeViewModel())
    }
    
}
