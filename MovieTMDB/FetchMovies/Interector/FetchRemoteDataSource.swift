//
//  FetchRemoteDataSource.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 31/05/22.
//

import Foundation
import Combine

class FetchRemoteDataSource {
    
    
    static var shered = FetchRemoteDataSource()
    
    private init() {}
    
    func buscarFilmes(fetch: String) -> Future<MovieResponse, AppError> {
        return Future<MovieResponse, AppError> { promice in
            WebService.filmeBusca(fetch: fetch) { result in
                switch result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    let response = try? decoder.decode(MovieResponse.self, from: data)
                    guard let res = response else {
                        print("Error parse \(String(data:data, encoding: .utf8)!)")
                        return
                    }
                    promice(.success(res))
                    break
                case .failure(_, let data):
                    if let data = data {
                        print(data)
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
