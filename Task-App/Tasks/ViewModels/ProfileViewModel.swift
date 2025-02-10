//
//  ProfileViewModel.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewModel: ObservableObject{
    init(){}
    
    func toggleIsDone(item : TaskItem){
        //It is neccessary to create a copy of our item because item is unmutable and we want to modify one of it's properties
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        //Update database
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore() //get access to database
        db.collection("users")
            .document(uid)
            .collection("Tasks")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
