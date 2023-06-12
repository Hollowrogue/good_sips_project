//
// BarTabList.swift
// Good Sips
//
// BarTabList : Stores List of Drinks User wants to try
// Accessed from : MainVIew
// Accesses : DataStore, RatingView
//
// Created by Katelin Vincent on 3/4/22.
// Tested by Afiya Vora on 6/20/22.
// Tested by Zohair Ali Khan on 6/20/22

import SwiftUI
import Combine


struct BarTabList: View {
    // AppView for task handler
    @ObservedObject var taskStore : TaskStore
    @State var newToDo : String = ""

      var searchBar : some View{
        HStack { // Prompt to add new drink to bar tab
          TextField("Add new Mixed Drink", text:         self.$newToDo)
                .padding()
                .background(.white)
                .foregroundColor(.black)
          Button(action: self.addNewToDo, label:{
              Text("Add New")
                  .padding()
                  .background(.white)
          })
        }
      }

      func addNewToDo(){
        taskStore.tasks.append(DSTask(id: String(taskStore.tasks.count + 1), toDoItem: newToDo))
        self.newToDo = ""
        // add auto generated id in the future
      }


    var body: some View {

          VStack{
              HStack {
                  Image("BarTab") // good sips icon
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 100, height: 40, alignment: .center)
                      .frame(maxWidth: .infinity)
                      .background(.white)
                      
              }
              searchBar.padding()
            List{
              ForEach($taskStore.tasks){
                  
                $task in
                  HStack{
                      Text(task.toDoItem)
                      Spacer()
                      RatingView(rating: $task.rating)
                          .onChange(of: task.rating){ value in // change to checkmark bool variable
                              async {
                                  if value > 0 {
                                      // Call function that adds
                                  }
                              }
                              
                          }
                  }
              }.onMove(perform: self.move)
              .onDelete(perform: self.delete) // Add checkbox function - move drink to bottoms, insert pop up to ask for rating
            }
        
            .cornerRadius(20)
            .padding()
            }.navigationBarItems(trailing: EditButton())
            
                .background{
                Image("Bar photo")
                    .resizable()
                    
                    .aspectRatio(contentMode: .fill)
            }
        
    }
    
    func move(from source : IndexSet, to destination: Int){  // Change order of bar tab
      taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet){ // Delete drink off bar tab
      taskStore.tasks.remove(atOffsets : offsets)
    }
    
}



struct BarTabList_Previews: PreviewProvider {
    static var previews: some View {
        BarTabList(taskStore: .init())
    }
}
