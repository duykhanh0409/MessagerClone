//
//  ChatView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 21/01/2024.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user:User
    
    // this is a way to inject user into ChatViewModel
    init( user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            ScrollView{
                //header
                VStack {
                    CirculaProfileImageView(user: user, size: .xLarge)
                    VStack(spacing:4){
                        Text(user.fullname)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                //Messages
                
                LazyVStack{
                    ForEach(viewModel.messages, id: \.self) { message in
                        ChatMessageCell(message: message)
                    }
                }
               
            }
            
            Spacer()
            
            ZStack(alignment: .trailing, content: {
                TextField("Message....", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button(action: {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                }, label: {
                    Text("Send")
                        .fontWeight(.semibold)
                })
                .padding(.horizontal)
            })
            .padding()
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}
