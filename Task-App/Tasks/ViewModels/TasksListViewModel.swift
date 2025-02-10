//
//  TasksListViewModel.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import FirebaseFirestore
import Foundation
//View Model for list of items view
//Primary tab
class TasksListViewModel: ObservableObject{
    @Published var showingNewItemView = false
    private let userId : String
    
    init(userId: String){
        self.userId = userId
    }
    
    //Delete tasks from tasks list
    // -Parameter id: item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("Tasks")
            .document(id)
            .delete()
    }
}

