//
//  LoginView.swift
//  SearchingMate
//
//  Created by Leon Langhauser on 23.06.22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        NavigationView {
            ZStack {
                Color.cyan
                    .ignoresSafeArea()
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.35))
                Circle()
                    .scale(1.4)
                    .foregroundColor(.white.opacity(0.5))
                    
        VStack {
            Text("SearchingMate")
                .font(.largeTitle)
                .foregroundColor(.white)
                .font(Font.subheadline)
            

            TextField("Email Adresse", text: $loginVM.credentials.email)
                .keyboardType(.emailAddress)
                .frame(width: 300, height: 50)
                .cornerRadius(20)
                .padding(10)
                .multilineTextAlignment(.center)
            
            SecureField("Password", text: $loginVM.credentials.password)
                .frame(width: 300, height: 50)
                .cornerRadius(20)
                .multilineTextAlignment(.center)
            if loginVM.showProgressView {
                    ProgressView()
            }
        Button("Log in") {
            loginVM.login { success in
                authentication.updateValidation(success: success)
            }
        }
        .disabled(loginVM.loginDisabled)
        .padding(.bottom,20)
        Image("LaunchScreen")
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        Spacer()
    }
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .disabled(loginVM.showProgressView)
        .alert(item: $loginVM.error) { error in
            Alert(title: Text("Login Fehlgeschlagen"), message: Text(error.localizedDescription))
                }
            }
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
