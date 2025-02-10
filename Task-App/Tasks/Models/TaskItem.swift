//
//  TaskItem.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import Foundation

struct TaskItem: Codable, Identifiable{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }

}
