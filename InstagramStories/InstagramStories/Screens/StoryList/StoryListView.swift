//
//  StoryListView.swift
//  InstagramStories
//
//  Created by Dmytro Yaremyshyn on 25/06/2025.
//

import SwiftUI

struct StoryListView: View {
    @State private var viewModel = StoryListViewModel()
    @State private var presentedView: AnyView?
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.05).ignoresSafeArea()
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(viewModel.stories) { story in
                            StoryCellView(story: story)
                                .onTapGesture {
                                    presentedView = AnyView(StoryDetailView(viewModel: viewModel.buildViewModel(story: story)))
                                }
                                .onAppear() {
                                    viewModel.loadMoreStories(ifNeededFor: story.id)
                                }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                PostView(
                    username: viewModel.stories.first?.name,
                    profileImageUrl: viewModel.stories.first?.profilePictureURL
                )
                PostView(
                    username: viewModel.stories.last?.name,
                    profileImageUrl: viewModel.stories.last?.profilePictureURL
                )
            }
        }
        .fullScreenCover($presentedView)
    }
}



#Preview {
    StoryListView()
}
