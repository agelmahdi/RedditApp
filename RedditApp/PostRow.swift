//
//  PostRow.swift
//  RedditApp
//
//  Created by Ahmed El-Mahdi on 12/1/19.
//  Copyright © 2019 Ahmed El-Mahdi. All rights reserved.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    
    var body: some View {
        HStack{
                Image(systemName: "photo.fill")
                    .font(.largeTitle)
            VStack(alignment: .leading){
                Text(post.title).font(.headline)
            Text(post.subredditNamePrefixed).font(.subheadline).foregroundColor(Color.gray)
                
                
            }
        }
    }
}
struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        PostRow(post: Post(id: "", title: "Title", author: "author", url: "https://google.com", subredditNamePrefixed: "r/funny")).previewLayout(.sizeThatFits)
    }
}
