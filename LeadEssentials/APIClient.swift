//
//  APIClient.swift
//  LeadEssentials
//
//  Created by Martin Doyle on 11/02/2025.
//

import Foundation

struct FeedItem {}

class FeedLoaderViewController {
    
    let loader: FeedLoader
    
    init(loader: FeedLoader) {
        self.loader = loader
    }
    
    func load() {
        loader.loadFeed(completion: {
            items in
            
        })
    }
}

struct Reachability {
    var isReachable: Bool
}

class RemoteFeedLoaderWithLocalFallback: FeedLoader {
    let local: LocalFeedLoader
    let remote: RemoteFeedLoader
    let reachability: Reachability = Reachability(isReachable: true)
    
    init(local: LocalFeedLoader, remote: RemoteFeedLoader) {
        self.local = local
        self.remote = remote
    }
    
    func loadFeed(completion: @escaping ([FeedItem]) -> Void) {
        if (reachability.isReachable) {
            remote.loadFeed {
                items in
                completion(items)
            }
        } else {
            local.loadFeed {
                items in
                completion(items)
            }
        }
    }
    
}

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ([FeedItem]) -> Void) {
        completion([FeedItem()])
    }
}

class RemoteFeedLoader: FeedLoader {
    func loadFeed(completion: @escaping ([FeedItem]) -> Void) {
        completion([])
    }
}




