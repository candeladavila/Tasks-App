//
//  ContentView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import SwiftUI

struct MainView: View {
    //Before showing LoginView check if a user is already logged in
    @StateObject var viewModel = MainViewModel()
    
    init() {
        //Changes color of icons and text from tabItems
        UITabBar.appearance().tintColor = UIColor.green
    }
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            //if already signed in
            accountView
        } else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            TasksListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile",systemImage:"person.circle")
                }
        }
        .onAppear {
            UITabBar.appearance().tintColor = UIColor.green
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        MainView()
    }
}


