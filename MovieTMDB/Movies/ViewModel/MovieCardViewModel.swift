//
//  MovieCardViewModel.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import Foundation
import SwiftUI


struct MovieCardViewModel: Identifiable, Equatable {
    
    var id: Int = 0
    var title: String
    var poster: String?
    var desc: String
    var data: String
    
    
    static func == (lhs: MovieCardViewModel, rhs: MovieCardViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func movieDetailView() -> some View {
        return MovieCardViewRouter.makeMovieDetailView(id: id, title: title, poster: poster, disc: desc, date: data)
    }
    
}
