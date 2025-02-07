//
//  LoginView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import SwiftUI
struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        /*
         We use a NavigationView because it allows us to move to another view
         In this particular case we are going to move to RegisterView
         */
        NavigationView{
            VStack{
                //Header
                HeaderView() //It is declared in a different file (abstraction)
                
                //Login Form
                Form{
                    TextField("Email Adress", text:$email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text:$password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button{
                        //Attempt log in
                    } label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Log in")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                }
                
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
