//
//  MovieUiState.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import SwiftUI

enum MovieUiState: Equatable {
    case none
    case loading
    case emptList
    case fullList([MovieCardViewModel])
}
