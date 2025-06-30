//
//  PostView.swift
//  InstagramStories
//
//  Created by (Admin) Dmytro Yaremyshyn on 27/06/2025.
//

import SwiftUI

struct PostView: View {
    let username: String?
    let profileImageUrl: String?
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(url: URL(string: profileImageUrl ?? "")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .smallSize()
                                .clipShape(.circle)
                        } else {
                            Circle()
                                .fill(Color.gray)
                                .smallSize()
                        }
                    }
                    Text(username ?? "")
                        .font(.caption)
                    Spacer()
                }
                AsyncImage(url: URL(string: profileImageUrl ?? "")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                    } else {
                        Color.gray.ignoresSafeArea()
                    }
                }
                HStack {
                    Image(systemName: "heart").smallSize()
                        
                    Text("23").font(.body)
                    Image(systemName: "message").smallSize()
                    Text("5").font(.body)
                    Image(systemName: "paperplane").offset(x: 3)
                    Text("12").font(.body)
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
    }
}

#Preview {
    ScrollView {
        PostView(
            username: "Neo",
            profileImageUrl: "https://i.pravatar.cc/300?u=1"
        )
    }
}
