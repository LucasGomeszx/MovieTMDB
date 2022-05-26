//
//  MovieCardViewRouter.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 26/05/22.
//

import SwiftUI

enum MovieCardViewRouter {
    static func makeMovieDetailView(id: Int, title: String, poster: String?, disc: String, date: String) -> some View {
        let viewModel = MovieDetailViewModel(id: id, title: title, poster: poster ?? "", disc: disc, date: date)
        return MovieDetailView(viewModel: viewModel)
    }
}
