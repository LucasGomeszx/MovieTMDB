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
    
    private init() {
    }
    
    func buscarFilmesPopulares() -> Future<[Results], AppError> {
        return Future<[Results], AppError> { promice in
            WebService.call(method: .get) { result in
                switch result {
                    
                // Filmes populares.
                case .success(let data):
                    let decoder = JSONDecoder()
                    let response = try? decoder.decode(MovieResponse.self, from: data)
                    guard let res = response else {
                        print("Error parse \(String(data:data, encoding: .utf8)!)")
                        return
                    }
                    print(res.results)
                    promice(.success(res.results))
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
