//
//  LoginViewModel.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        guard validate() else{ //Checks format with private function below
            return
        }
        
        //Try to log in a user
        Auth.auth().signIn(withEmail: email, password: password) //Firebase work
        
    }
    
    private func validate() -> Bool{ //Returns a boolean that indicates if data is valid (format)
        errorMessage = ""
        //Check if email or password are empty
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all fields."
            return false
        }
        //Check if an email is valid (email@email.com)
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
