//
// MainView.swift
// Good Sips
//
// MainView : Navigation Bar
// Accessed from : GoodSipsApp
// Accesses : BarTabList, MySpis and ContentView
//
// Created by Katelin Vincent on 3/4/22.
// Tested by Afiya Vora on 6/20/22.

import SwiftUI

struct MainView: View {
    @StateObject var taskStore = TaskStore()
    
    var body: some View {
        
        TabView{
                ContentView() // Home page: Searching and Master List
                    .tabItem{
                        Image(systemName: "magnifyingglass")//("search bar icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                        Text("Search")
                    }
            MySips(taskStore: taskStore) // Rated Drinks Page
                .tabItem{
                    //Label("My Sips", systemImage: "list.dash")
                    Image(systemName: "line.horizontal.star.fill.line.horizontal")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 90, height: 90)
                    Text("My Sips")
                    }
            BarTabList(taskStore: taskStore) // Drinks to try list
                    .tabItem{
                        //Label("Bar Tabs", systemImage: "list.dash")
                        Image(systemName: "square.and.arrow.up")//("bar tabs icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                        Text("Bar Tabs")
                    }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
