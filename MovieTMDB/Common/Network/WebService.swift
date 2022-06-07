//
//  WebService.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 04/05/22.
//

import Foundation

enum WebService {
    
    enum Endpoint: String {
        case base = "https://api.themoviedb.org/3"
        case apiKey = "api_key=a418c1d2207524b9f775ba6cb3c50ad6"
        case popular = "/movie/popular"
        case buscar = "/search/movie?&query="
    }
    
    enum Method: String {
        case get
    }
    
    enum NetworkError {
        case badRequest
        case notFound
        case unathorized
        case internalServerError
    }
    
    enum Result {
        case success(Data)
        case failure(NetworkError, Data?)
    }
    
    static func filmesPopulares(path: Endpoint, completion: @escaping (Result) -> Void) {
        guard let url = URL(string: "\(Endpoint.base.rawValue)\(path.rawValue)\("?" + Endpoint.apiKey.rawValue)") else { return }
        let filmesPopulares = URLRequest(url: url)
        
        callFetch(method: .get, fetch: filmesPopulares, completion: completion)
    }
    
    static func filmeBusca(fetch: String, completion: @escaping (Result) -> Void) {
        var nomeFilme:[String] = []
        for i in fetch {
            if i != " "{
                nomeFilme.append("\(i)")
            }else {
                nomeFilme.append("%20")
            }
        }
        print(nomeFilme)
        guard let url = URL(string: "\(Endpoint.base.rawValue)\(Endpoint.buscar.rawValue)\(nomeFilme.joined())\("&"+Endpoint.apiKey.rawValue)") else {return}
        
        let busca = URLRequest(url: url)
        
        callFetch(method: .get, fetch: busca, completion: completion)
    }
    
    static func callFetch(method: Method, fetch: URLRequest?, completion: @escaping (Result) -> Void){
        
        guard var urlRequest = fetch else {return}
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.internalServerError, nil))
                return
            }
            
            if let r = response as? HTTPURLResponse {
                switch r.statusCode {
                case 404:
                    completion(.failure(.notFound, data))
                    break
                case 401:
                    completion(.failure(.unathorized, data))
                    break
                case 200:
                    completion(.success(data))
                    break
                default:
                    break
                }
            }
        }
        task.resume()
    }
}
