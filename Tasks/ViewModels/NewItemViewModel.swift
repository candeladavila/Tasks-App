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

    init(){}
    
    func save(){
        
    }
}
