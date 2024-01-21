//
//  LoginView.swift
//  MessagerClone
//
//  Created by Khanh Nguyen on 20/01/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack{
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
                    
                    //forgot button
                    
                    Button(action: {
                        print("forgot password")
                    }, label: {
                        Text("Fotgot password")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing,28)
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                //login button
                
                Button(action:{
                        
                } , label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                })
                .padding(.vertical)
                
                //Facbook login
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                
                HStack{
                    Image("facebook")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                    
                }
                
                Spacer()
                
                Divider()
                NavigationLink {
                   RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3, content: {
                            Text("Don't have an account?")
                            Text("Sign up")
                            .fontWeight(.semibold)
                        
                    }).font(.footnote)
                }
                .padding(.vertical)

            }
        }
    }
}

#Preview {
    LoginView()
}
