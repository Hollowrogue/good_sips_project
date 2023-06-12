//
// MySips.swift
// Good Sips
//
// MySips : Displays drinks user has rated
// Accessed from : MainView
// Accesses : DataStore, RatingView
//
// Created by Katelin Vincent on 2/28/22.
// Tested by Afiya Vora on 6/20/22.
// Tested by Zohair Khan on 6/20/22


import SwiftUI
import Foundation
import UIKit


struct MySips: View {
    
    @ObservedObject var taskStore : TaskStore
    @StateObject private var drinkListVM = DrinkListViewModel()
    @StateObject private var drinkListMaster = DrinkListViewModel()
    @State var thoughts : String = ""
    
    var body: some View {
        
        NavigationView {
                    ZStack {
                        VStack {
                            Spacer().frame(height: 44.0)
                            HStack {
                                Spacer()
                                Image("MySips") // good sips icon
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 40, alignment: .center)
                                Spacer()
                        }
                            Spacer()
                        }
                        .edgesIgnoringSafeArea(.top)

                        .background()
                        VStack {
                    Spacer()
                    .background()
                            VStack{
                                            HStack {
                                                    Spacer()
                                                        List{ // Print Drink Bar tab names and ratings , only shows if rating is greater than 0
                                                            ForEach(taskStore.tasks.filter{task in
                                                                task.rating>0
                                                            }){

                                                            task in
                                                              HStack{
                                                                  Text(task.toDoItem)

                                                                  Spacer()
                                                                  RatingView(rating: Binding(get: {
                                                                      task.rating
                                                                  }, set: {new in
                                                                      if let idx = taskStore.tasks.firstIndex(where: { oldtask in
                                                                          oldtask.id == task.id
                                                                      }){
                                                                          taskStore.tasks[idx].rating = new
                                                                      }
                                                                  }))
                                                              }
                                                               
                                                                TextField("Review? ", text: $thoughts) }
                                                          }
                                                        }.cornerRadius(20)
                                                        .padding()
                                                    
                                                Spacer()
                                                }
                                            
                                            Spacer()
                                            Spacer()

                                           }
                        
                                        .background{
                                            Image("Bar photo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
}

struct MySips_Previews: PreviewProvider
    {
        static var previews: some View
        {
            MySips(taskStore: .init())
        }
    }
}
