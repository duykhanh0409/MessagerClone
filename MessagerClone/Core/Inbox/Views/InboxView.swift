//
//  InboxView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 21/01/2024.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
//    @State private var user = User.MOCK_USER
    
    private var user:User? {
        return viewModel.currentUser
    }
    var body: some View {
        NavigationStack {

                List {
                    ActiveNowView()
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .padding(.vertical)
                        .padding(.horizontal,4)
                    ForEach(viewModel.recentMessages, id: \.self) { message in
                        ZStack{
                            NavigationLink(value: message) {
                                EmptyView()
                            }.opacity(0.0)
                            
                            InboxRowView(message: message)
                        }
                    }
                }
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(PlainListStyle())
            .onChange(of: selectedUser, perform: { newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: Message.self, destination: { message in
                if let user = message.user {
                    ChatView(user: user)
                }
            })
            .navigationDestination(for: Route.self, destination: { route in
                switch route {
                case .profile(let user):
                    ProfileView(user: user)
                case .chatView(let user):
                    ChatView(user: user)
                }
            })
           .navigationDestination(isPresented: $showChat, destination: {
               if let user = selectedUser {
                   ChatView(user: user)
               }
           })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    if let user {
                        NavigationLink(value: Route.profile(user)) {
                                CirculaProfileImageView(user: user, size: .xSmall)
                            }
                    }
                       
                   
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showNewMessageView.toggle()
                        selectedUser = nil
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
