//
//  FeedView.swift
//  Instagram
//
//  Created by Omkar Anarse on 28/11/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                List {
                    // Stories
                    StoryView()
                        .listRowSeparator(.hidden)

                    LazyVStack(spacing: 25) {
                        ForEach(Post.MOCK_POST) { post in
                            FeedCell(post: post)
                        }
                    }
                    .listRowInsets(EdgeInsets()) // Remove padding for LazyVStack
                }
                .listStyle(.plain)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image("insta_logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 116.00001, height: 33.1031)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        HStack {
                            Image(systemName: "heart")
                                .imageScale(.large)
                            Image(systemName: "paperplane")
                                .imageScale(.large)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}


struct StoryView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(0..<50) { _ in
                    VStack {
                        Image("green")
                            .resizable()
                            .frame(width: 62.5, height: 62.5)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(Color.red)
                            }

                        Text("Stories")
                            .font(Font.custom("SF Pro Text", size: 12))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.primary)
                    }
                    .frame(width: 66, height: 83)
                }
            }
            .padding(.horizontal, 0) // Remove horizontal padding
            
        }
    }
}
