//
//  RedditService.swift
//  RedditApp
//
//  Created by Ahmed El-Mahdi on 12/1/19.
//  Copyright © 2019 Ahmed El-Mahdi. All rights reserved.
//

import Foundation

class RedditService {
    
    private let session : URLSession
    private let jsonDecoder : JSONDecoder
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session=session
        self.jsonDecoder=decoder
    }
    func searchReddit(for query: String ,completion: @escaping (Result<[Post], Error>) -> Void) {
        let timpQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let url = URL(string: "https://www.reddit.com/\(timpQuery.count == 0 ? "" : "r/\(timpQuery)").json")  else {
            preconditionFailure("Failed to construct search URL for query: \(query)")
        }
        
        session.dataTask(with: url) { [weak self] data, _, error in
            if let error = error{
                completion(.failure(error))
            }
            else{
                do{
                    let data = data ?? Data()
                    
                    let response = try self?.jsonDecoder.decode(Listing.self, from: data)

                    completion(.success(response?.posts ?? []))
                
                }
                catch{
                    completion(.failure(error))

                }
                
                
            }
        }.resume()
    }
}
