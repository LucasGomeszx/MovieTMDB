//
//  MovieCardViewModel.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import Foundation


struct MovieCardViewModel: Identifiable, Equatable {
    
    let id: Int = 0
    
    
    static func == (lhz: MovieCardViewModel, rhz: MovieCardViewModel) -> Bool {
        return lhz.id == rhz.id
    }
    
}
