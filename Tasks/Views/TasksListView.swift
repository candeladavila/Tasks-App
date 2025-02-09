//
//  TasksItemsView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import SwiftUI

struct TasksListView: View {
    @StateObject var viewModel = TasksListViewModel()
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Tasks")
            .toolbar{
                Button{
                    //Action
                } label:{
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    TasksListView(userId: "")
}
