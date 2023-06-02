//
//  HomeService.swift
//  SearchMovies
//
//  Created by Jadiê on 01/06/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

struct HomeService {
    init(){
        print("Init homeservice")
    }
    
    func runApi(completion: @escaping (Result<MoviesPage, Error>) -> Void) {
        let session = URLSession(configuration: .default)
        
        guard let urlApi = URL(string: "https://api.themoviedb.org/3/discover/movie") else { return }
        var urlRequest = URLRequest(url: urlApi)
        
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzY2Y1ZTRhODBlYWM4MGE3YTZkMjM2MTE0ZmYyZTI3NiIsInN1YiI6IjY0NzhhOWZiZTMyM2YzMDEyNzUwNjE1NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nT6ts9SPMb9q5Yfa3kMiaa_utXdwLuLu2HSFnzSYQlE", forHTTPHeaderField: "Authorization")
        
        session.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NSError(domain: "Error", code: 400)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Error", code: 400)))
                return
            }
            
            do {
                let movies = try JSONDecoder().decode(MoviesPage.self, from: data)
                completion(.success(movies))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
        
    }
}
