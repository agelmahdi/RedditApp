//
//  Listing.swift
//  RedditApp
//
//  Created by Ahmed El-Mahdi on 12/1/19.
//  Copyright © 2019 Ahmed El-Mahdi. All rights reserved.
//

import Foundation

struct Listing  {
    
    var posts = [Post]()

}
extension Listing: Decodable {
    
    enum CodingKeys : String, CodingKey {
     case posts = "children"
        
        case data
    }
    init(from decoder: Decoder) throws {
        let value = try! decoder.container(keyedBy: CodingKeys.self)
        let data = try! value.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        posts = try! data.decode([Post].self, forKey: .posts)
        
    }
}
