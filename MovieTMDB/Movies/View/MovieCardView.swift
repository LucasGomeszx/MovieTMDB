//
//  MovieCardView.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import SwiftUI

struct MovieCardView: View {
    
    let viewModel: MovieCardViewModel
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Text(viewModel.title)
        }
    }
    
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(viewModel: MovieCardViewModel(title: "Miranha"))
    }
}
