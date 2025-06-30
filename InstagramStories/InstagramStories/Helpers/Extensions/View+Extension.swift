//
//  View+Extension.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 27/06/2025.
//

import SwiftUI

extension View {
    /// frame(width: 30, height: 30)
    func smallSize() -> some View {
        return self.frame(width: 30, height: 30)
    }
    
    /// frame(width: 60, height: 60)
    func mediumSize() -> some View {
        return self.frame(width: 60, height: 60)
    }
}
