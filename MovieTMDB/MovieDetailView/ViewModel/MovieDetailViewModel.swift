//
//  MovieDetailViewModel.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 26/05/22.
//

import SwiftUI

class MovieDetailViewModel: ObservableObject {
    let id: Int
    let title: String
    let poster: String
    let disc: String
    let date: String
    
    init(id: Int, title: String, poster: String, disc: String, date: String){
        self.id = id
        self.title = title
        self.poster = poster
        self.disc = disc
        self.date = date
    }
    
}
