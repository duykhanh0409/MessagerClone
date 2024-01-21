//
//  InboxView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 21/01/2024.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
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
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView()
            })
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image(systemName: "person.circle.fill")
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
