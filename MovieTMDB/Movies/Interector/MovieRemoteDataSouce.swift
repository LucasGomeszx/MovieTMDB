//
//  MovieRemoteDataSouce.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 05/05/22.
//

import Foundation
import Combine

class MovieRemoteDataSource {
    
    static var shered: MovieRemoteDataSource = MovieRemoteDataSource()
    
    var page = 1
    var totalPage = 1
    
    private init() {
    }
    
    func buscarFilmesPopulares() -> Future<MovieResponse, AppError> {
        return Future<MovieResponse, AppError> { promice in
            WebService.filmesPopulares(path: .popular, page: self.page) { result in
                switch result {
                    
                // Filmes populares.
                case .success(let data):
                    let decoder = JSONDecoder()
                    let response = try? decoder.decode(MovieResponse.self, from: data)
                    guard let res = response else {
                        print("Error parse \(String(data:data, encoding: .utf8)!)")
                        return
                    }
                    self.page = res.page + 1
                    self.totalPage = res.totalPages
                    promice(.success(res))
                    break
                    
                // Erro no request.
                case .failure(_, let data):
                    if let data = data {
                        let decoder = JSONDecoder()
                        let response = try? decoder.decode(MovieResponseError.self, from: data)
                        promice(.failure(AppError.response(message: response?.status_message ?? "Error desconhecido")))
                    }
                    break
                }
            }
        }
    }
}
