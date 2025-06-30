//
//  ContentView.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 25/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            StoryListView()
                .navigationTitle("Instagram Stories")
        }
    }
}

#Preview {
    ContentView()
}
