//
//  ChatMessageCell.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 21/01/2024.
//

import SwiftUI

struct ChatMessageCell: View {
    let isFromCurrentUser: Bool
    var body: some View {
        HStack{
            if isFromCurrentUser {
                Spacer()
                Text("This is a test message for now, with message is a longer message")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            }else {
                HStack(alignment: .bottom,spacing: 9, content: {
                    CirculaProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                    Text("This is a test message for now")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .leading)
                    
                    Spacer()
                })
            }
        }
        .padding(.horizontal,8)
    }
}

#Preview {
    ChatMessageCell(isFromCurrentUser: false)
}
