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
        self.userId = userId    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document("user_id")
            .collection("Tasks")
            .document(id)
            .delete()
    }
}

