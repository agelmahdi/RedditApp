//
//  PostsList.swift
//  RedditApp
//
//  Created by Ahmed El-Mahdi on 12/1/19.
//  Copyright © 2019 Ahmed El-Mahdi. All rights reserved.
//

import SwiftUI

struct PostsList: View {
    @ObservedObject var listingViewModel: ListingViewModel
    
    @State private var query = ""
    @State private var subredditTitle = "r/all"
    
    var body: some View {
        NavigationView {
            List {
                TextField("Search Subreddit", text: self.$query) {
                    self.subredditTitle = "r/\(self.query.lowercased())"
                    self.fetchListing()
                }
                ForEach(listingViewModel.posts) { post in
                  NavigationLink(destination: WebView(request: URLRequest(url: URL(string: post.url)!))) {
                        PostRow(post: post)
                    }
                }
            }.navigationBarTitle(Text(subredditTitle))
        }.onAppear(perform: fetchListing)
    }
    
    private func fetchListing() {
        listingViewModel.fetchListing(for: query)
    }
}

#if DEBUG

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList(listingViewModel: ListingViewModel(service: RedditService()))
        
        
    }
}
#endif

