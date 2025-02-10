//
//  TasksItemsView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import FirebaseFirestore
import SwiftUI

struct TasksListView: View {
    @StateObject var viewModel: TasksListViewModel
    @FirestoreQuery var items: [TaskItem]

    
    init(userId: String){
        //users /<id> /tasks/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/Tasks")
        self._viewModel = StateObject(
            wrappedValue:
                TasksListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    TasksItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Tasks")
            .toolbar{
                Button{
                    //Action
                    viewModel.showingNewItemView = true
                } label:{
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    TasksListView(userId: "MXDXKmVbekR8u1T6blCCX0MZjjr1")
}
