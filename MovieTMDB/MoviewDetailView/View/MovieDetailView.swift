//
//  MovieDetailView.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 26/05/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    @ObservedObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        Text(viewModel.title)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(id: 10, title: "Miranha", poster: "", disc: "Teste disc", date: "11/11/11"))
    }
}
