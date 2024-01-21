//
//  ProfileView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 21/01/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(Color(.systemGray4))
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
    ProfileView()
}
