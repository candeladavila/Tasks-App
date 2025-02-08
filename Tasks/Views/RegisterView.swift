//
//  RegisterView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title: "Register", subtitle: "Start organizing your tasks", angle: -15, background: .yellow)
                .offset(y:-30)
            
            Form{
                TextField("Full name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TButton(title: "Create an account", background: .green){
                    //Attempt to create an account
                    viewModel.register()
                }
                .padding()
            }
            .offset(y:-70)
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
