//
//  ChatView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 21/01/2024.
//

import SwiftUI

struct ChatView: View {
    @State private var messsageText = ""
    var body: some View {
        VStack {
            ScrollView{
                //header
                VStack {
                    CirculaProfileImageView(user: User.MOCK_USER, size: .xLarge)
                    VStack(spacing:4){
                        Text("Khanh Nguyen")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Khanh Nguyen")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                //Messages
                
                ForEach(0 ... 15, id: \.self) { message in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                }
               
            }
            
            Spacer()
            
            ZStack(alignment: .trailing, content: {
                TextField("Message....", text: $messsageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Send")
                        .fontWeight(.semibold)
                })
                .padding(.horizontal)
            })
            .padding()
        }
    }
}

#Preview {
    ChatView()
}
