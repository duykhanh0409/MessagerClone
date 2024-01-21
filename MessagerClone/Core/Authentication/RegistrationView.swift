//
//  RegistrationView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 20/01/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            // logo image
            Image("mesenger")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            // text field
            VStack(spacing: 12){
                TextField("Enter your email", text: $email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                
                SecureField("Enter your password", text: $password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                SecureField("Enter your password", text: $fullname)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal,24)
                
                Button(action:{
//                        dismiss()
                } , label: {
                    Text("Sign up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                })
                .padding(.vertical)
            }
            
            Spacer()
            Divider()
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Text("Already have an account ?")
                    Text("Sign in")
                        .fontWeight(.semibold)
                    
                }
                .font(.footnote)
            }
            .padding(.vertical)
        }
       
    }
}

#Preview {
    RegistrationView()
}
