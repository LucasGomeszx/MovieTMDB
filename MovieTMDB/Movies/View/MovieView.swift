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
        Text("Estou na MovieView.")
            .onAppear(perform: viewModel.onAppear)
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(viewModel: MovieViewModel())
    }
}
