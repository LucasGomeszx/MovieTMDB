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
        ScrollView{
            
            VStack{
                
                Text(viewModel.title)
                    .font(.title).bold()
                
                ImageView(url: viewModel.poster)
                    .scaledToFit()
                    .frame(maxWidth: .infinity , maxHeight: 500)
                
                Text("Lancamento: " + viewModel.date)
                
                Text(viewModel.disc)
                    .padding(20)
                
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(id: 10, title: "Miranha", poster: "https://image.tmdb.org/t/p//w500/g4tMniKxol1TBJrHlAtiDjjlx4Q.jpg", disc: "Tefdasfasdfasdfasdfsadfsadfasdfdsfasdfasdfasdfasdfdsdafsdfasdfsadfsdfasdfsdfsafasdfadsste disc", date: "11/11/11"))
    }
}
