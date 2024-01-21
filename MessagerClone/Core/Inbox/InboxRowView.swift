//
//  InboxRowView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 21/01/2024.
//

import SwiftUI


struct InboxRowView: View {
     
    var body: some View {
        HStack(alignment: .top,spacing: 12, content: {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .foregroundColor(Color(.systemGray4))
            
            VStack(alignment: .leading, spacing: 4){
                Text("khanh title")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("khanh Subtitme with more than one line")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
                
            }
            
            HStack{
                Text("Yesterday")
                Image(systemName: "chevron.right")
                
            }
            .font(.footnote)
            .foregroundColor(.gray)
        })
        .frame(height: 72)
    }
}

#Preview {
    InboxRowView()
}
