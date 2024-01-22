//
//  ProfileView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 21/01/2024.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    var body: some View {
        VStack{
            PhotosPicker(selection: $viewModel.selectedItem) {
                if let profileImage = viewModel.profileImage {
                    profileImage
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color(.systemGray4))
                        .clipShape(Circle())
                }else {
                    CirculaProfileImageView(user: user, size: .xLarge)
                }
                   
            }
            Text("Khanh Nguyen")
                .font(.title2)
                .fontWeight(.semibold)
            
            //List
            
            List {
                Section {
                    ForEach(SettingOptionsViewModel.allCases) { option in
                        HStack{
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackground)
                            
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                
                Section {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Log out")
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Delete")
                    })
                }
                .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER)
}
