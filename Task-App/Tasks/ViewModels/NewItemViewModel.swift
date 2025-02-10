//
//  NewItemViewModel.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    init(){}
    
    func save(){
        guard canSave else{
            return
        }
        
        //Get user Id to create a collection
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        //Create model
        let newId = UUID().uuidString
        let newItem = TaskItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        //Save model in the database
        let db = Firestore.firestore() //create instance of database
        db.collection("users")
            .document(uId)
            .collection("Tasks")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            //We substract the number of seconds a day has to take into account hour and minutes of the dueDate
            return false
        }
        return true
    }
}
