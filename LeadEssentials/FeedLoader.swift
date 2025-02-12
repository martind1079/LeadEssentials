//
//  FeedLoader.swift
//  LeadEssentials
//
//  Created by Martin Doyle on 12/02/2025.
//

import Foundation

protocol FeedLoader {
    func loadFeed(completion: @escaping ([FeedItem]) -> Void)
}
