//
//  UserReader.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 28/06/2025.
//

import Foundation

protocol UserReader {
    func read(fileName: String) throws -> UsersResponse
}
