//
//  Persistence.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 28/06/2025.
//

import Foundation
import Combine

protocol Persistence {
    var seenStoryUpdatedPublisher: AnyPublisher<Int, Never> { get }
    
    func seen(_ storyId: Int)
    func toggleLike(_ storyId: Int)
    func isSeen(_ storyId: Int) -> Bool
    func isLiked(_ storyId: Int) -> Bool
}
