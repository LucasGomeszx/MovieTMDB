//
//  MovieCardView.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import SwiftUI

struct MovieCardView: View {
    
    @State private var action = false
    
    let viewModel: MovieCardViewModel
    
    var body: some View {
        ZStack {
            
            NavigationLink(destination: viewModel.movieDetailView(),
                           isActive: self.$action,
                           label: {EmptyView()})
            
            Button {
                self.action = true
            } label: {
                HStack (alignment: .top) {
                    VStack {
                        
                        ImageView(url: viewModel.poster ?? "")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 200)
                            .clipped()
                        
                        Text(viewModel.data)
                            .foregroundColor(.gray)
                        
                    }

                    VStack(alignment: .leading, spacing: 5){
                        
                        Text(viewModel.title)
                            .foregroundColor(Color.black)
                            .font(.title3)
                            .bold()
                        
                        Text(viewModel.desc)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .lineLimit(6)
                            
                    }
                    Spacer()
                }.padding()
            }
        }.background(
            RoundedRectangle(cornerRadius: 4.0)
                .stroke(Color.orange, lineWidth: 1.4)
                .shadow(color: .gray, radius: 2, x: 2.0, y: 2.0 )
        )
        .padding(.leading,10)
        .padding(.trailing,10)
    }
    
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(viewModel: MovieCardViewModel(id: 0, title: "Miranha", poster: "https://image.tmdb.org/t/p//w500/g4tMniKxol1TBJrHlAtiDjjlx4Q.jpg", desc: "Disc", data: "11/11/11"))
    }
}
