//
//  ActiveNowView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 21/01/2024.
//

import SwiftUI

struct ActiveNowView: View {
    @StateObject var viewModel = ActiveViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32){
                ForEach(viewModel.users, id: \.self) { user in
                    NavigationLink(value: Route.chatView(user)) {
                        VStack{
                            ZStack(alignment: .bottomTrailing, content: {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 64, height: 64)
                                    .foregroundColor(Color(.systemGray4))
                                
                                ZStack(content: {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 18,height: 18)
                                    
                                    Circle()
                                        .fill(Color(.systemGreen))
                                        .frame(width: 12,height: 12)
                                })
                            })
                            Text(user.firstName)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(height: 106)
    }
}

#Preview {
    ActiveNowView()
}
