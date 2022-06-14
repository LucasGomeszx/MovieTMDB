//
//  ImageView.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 10/05/22.
//

import SwiftUI
import Combine

struct ImageView: View {
    
    @State var image: UIImage = UIImage()
    @ObservedObject var imageLoader: ImageLoader
    let imageLink = "https://image.tmdb.org/t/p//w500"
    
    init(url: String) {
        imageLoader = ImageLoader(url: "\(imageLink + url)")
    }
    
    var body: some View {
        Image(uiImage: UIImage(data: imageLoader.data) ?? image)
            .resizable()
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}

class ImageLoader: ObservableObject {
    
    var didChange = PassthroughSubject<Data, Never>()
    
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    init(url: String) {
        guard let url = URL(string: url) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://image.tmdb.org/t/p//w500/g4tMniKxol1TBJrHlAtiDjjlx4Q.jpg")
    }
}
