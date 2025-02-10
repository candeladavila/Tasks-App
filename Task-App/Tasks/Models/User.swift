//
//  User.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
