//
//  InboxView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 21/01/2024.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @State private var user = User.MOCK_USER
    var body: some View {
        NavigationStack {
            ActiveNowView()
            List {
                ForEach(0 ... 10, id: \.self) { message in
                    InboxRowView()
                }
                .listStyle(PlainListStyle())
                .frame(height: .infinity)
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView()
            })
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        NavigationLink(value: user) {
                            CirculaProfileImageView(user: user, size: .xSmall)
                        }
                        Text("Chats")
                            .font(.title)
                        
                            .fontWeight(.semibold)
                    }
                   
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showNewMessageView.toggle()
                    }, label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    })
                }
            })
        }
    }
}

#Preview {
    InboxView()
}
