//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Kavitha Vinodh on 09/05/21.
//  Copyright © 2021 Kavitha Vinodh. All rights reserved.
//

import Foundation

final class NetworkManager<T: Codable> {
    // Fetch the data from  the json
static func fetch(for url: URL!, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { ( data, response, error) in
        guard error == nil else {
            print(String(describing: error!))
            completion(.failure(.error(err: error!.localizedDescription)))
            return
        }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.inValidResponse))
                return
            }
            guard let data = data else{
            completion(.failure(.inValidData))
            return
            }
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
               print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }
            
        }.resume()
}
enum NetworkError: Error{
    case inValidResponse
    case inValidData
    case error(err: String)
    case decodingError(err: String)
}
}
