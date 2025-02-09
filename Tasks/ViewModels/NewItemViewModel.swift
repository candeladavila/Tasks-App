//
//  NewItemViewModel.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import Foundation

class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    init(){}
    
    func save(){
        
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
