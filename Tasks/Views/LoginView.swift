//
//  LoginView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import SwiftUI
struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel() //Create an instance of the model
    
    var body: some View {
        /*
         We use a NavigationView because it allows us to move to another view
         In this particular case we are going to move to RegisterView
         */
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "Tasks", subtitle: "Get things done", angle: 15, background: .green)
                //It is declared in a different file (abstraction)
                
                //Login Form
                Form{
                    TextField("Email Adress", text:$viewModel.email) //Access to parameters
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    //Extra modifications to make the app better
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text:$viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TButton(title: "Log in", background: .blue){
                        //Attempt to log in
                    }
                    .padding()
                }
                .offset(y:-50)
                
                //Create Account
                VStack{
                    Text("New around here?")
                    /*
                     NavigationLink allows to show a text and when touched go to declared view
                     */
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom,50)
                
                Spacer() //Creates an space and moves things up in the screen
            }
        }
    }
}


#Preview {
    LoginView()
}
