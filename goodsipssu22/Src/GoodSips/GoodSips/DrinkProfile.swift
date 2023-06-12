//
//  DrinkProfile.swift
//  Good Sips
//
// DrinkProfile : Displays Drink information
// Accessed from : Contentiew
// Accesses : BarTab
//
//  Created by Katelin Vincent on 2/28/22.
//  Tested by Afiya Vora on 6/20/22.
//  Modified by Afiya Vora on 06/27/2022.

import SwiftUI

struct DrinkProfile: View {
    
    @ObservedObject var drinkListVM :DrinkViewModel
    @StateObject var taskStore = TaskStore()
    @State private var showIngredients = true
    @State private var showInstructions = false
    @State private var showGlassType = false
    
    var body: some View {
        ZStack(alignment: .top){
            VStack(alignment: .center, spacing: 0){
                
                HStack {
                    Image("Good Sips Icons - words") // good sips icon at top
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 40, alignment: .center)
                }
                
                Divider()
                
                    VStack {
                        
                        Spacer().frame(height: 16.0) // Creates Space between divider and profile text
                        
                        HStack {
                            
                            Spacer().frame(width: 16.0) // Space between profile text and left edge
                            
                            VStack(alignment: .leading){ // Stacking Name/BarTab, Photo/Ingredients, Instructions,
                                
                                HStack{
                                        // Stacking name and bartab button
                                    
                                    Spacer()
                                    NavigationLink(destination: BarTabList(taskStore: taskStore)){
//                                            Image(systemName: "heart.fill")
//                                               // .accessibilityLabel("Add to BarTab")
//                                                .foregroundColor(.red)
//                                                .font(.largeTitle)// BarTab Button
//
                                        Text("Add drink to BarTab")
                                            .frame(width: 220, height: 25)
                                            .background(Color(red: 116/255, green: 149/255, blue: 154/255))
                                            .font(.system(size: 20))
                                            .foregroundColor(Color.white)
                                            .cornerRadius(5)
                                            
                                            }
                                    Spacer().frame(width: 20.0)
                                }
                                
                               // Spacer()
                                HStack(alignment: .top, spacing: 0){
                                    Spacer().frame(width: 0)
                                    // Photo and Ingredient Stack
                                    Group{ // Printing photo - if it can be accessed, bar photo if inaccessible
                                    if let StringUrl = drinkListVM.drink.strImageAttribution {
                                        AsyncImage(url: URL(string: StringUrl))
                                    }
                                    else{
                                        Image("Bar photo")
                                            .resizable()
                                    }
                                    }
                                    .frame(width: 150, height: 150, alignment: .top)
                                    
                                }
                            }
                        }
                    
                    VStack{ // Drink of the day information
                        
                        HStack{
                            Spacer().frame(width: 10.0)
                            
                            Text("Drink of the day: ")
                                .font(.system(size: 20))
                                .foregroundColor(Color.gray)
                                .bold()
                                .offset(x: 0, y: 0)

                            Text(drinkListVM.drink.strDrink) // place holder
                                .bold()
                                .font(.system(size: 20))
                                .offset(x: 0, y: 0)
                            Spacer()
                        }
                    }
                        
                ZStack{
                    VStack(alignment: .leading){
                    
                        Divider()
                        HStack{
                                Spacer().frame(width: 16.0)
                                Button("Ingredients"){
                                    showIngredients.toggle()
                                }.frame(width: 375, height: 50)
                                .background(Color(red: 116/255, green: 149/255, blue: 154/255))
                                .font(.system(size: 25))
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                        if showIngredients{
                            
                            ForEach(drinkListVM.drink.getIngredients()) // Print ingreidnts
                                {
                                    ingredient in
                                    HStack{
                                        Spacer().frame(width: 16.0)
                                        Text(ingredient.measurement)
                                        Text(ingredient.ingredient)
                                        Spacer()
                                    }
                                }
                            }

                        HStack{
                                Spacer().frame(width: 16.0)
                                Button("Instructions"){
                                    showInstructions.toggle()
                                }.frame(width: 375, height: 50)
                                .background(Color(red: 116/255, green: 149/255, blue: 154/255))
                                .font(.system(size: 25))
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                        if showInstructions{
                            
                            HStack{
                                Spacer().frame(width: 16.0)//Print instructions
                                Text(drinkListVM.drink.strInstructions)
                                Spacer()
                            }
                        }
 
                        HStack{
                                    Spacer().frame(width: 16.0)
                                    Button("Glass Type"){
                                        showGlassType.toggle()
                                    }.frame(width: 375, height: 50)
                                .background(Color(red: 116/255, green: 149/255, blue: 154/255))
                                .font(.system(size: 25))
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                        if showGlassType{
                                
                                HStack{
                                    Spacer().frame(width: 16.0)//Print glass information
                                    Text(drinkListVM.drink.strGlass)
                                    Spacer()
                                }
                            }
                        
                        }//vstack end
                }//zstack end
                                     
        }
            Spacer() // Pushes profile to top of page
            }
        }
    }
}

struct DrinkProfile_Previews: PreviewProvider {
    static var previews: some View {
        DrinkProfile(drinkListVM: .init(drink: .sample))
    }
}


