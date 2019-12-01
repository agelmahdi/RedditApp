//
//  ListingViewModel.swift
//  RedditApp
//
//  Created by Ahmed El-Mahdi on 12/1/19.
//  Copyright © 2019 Ahmed El-Mahdi. All rights reserved.
//

import Foundation
class ListingViewModel: ObservableObject {
    let service : RedditService
    
    @Published var subreddit = "r/all"
    @Published var posts = [Post]()
    
    init(service: RedditService) {
        self.service=service
    }
    
    func fetchListing(for query: String)  {
        service.searchReddit(for: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result{
                    
                case .success(let posts) :
                    self?.posts=posts
                    
                case .failure :
                    self?.posts = []
                    
                }
            }
        }
    }
    
}
