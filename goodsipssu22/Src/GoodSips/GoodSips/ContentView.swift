//
// ContentView.swift
// Good Sips
//
// ContentView : Naviates to a number of feature/home page
// Accessed from : MainView
// Accesses : MasterList, Featured, Routlette
//
// Created by Katelin Vincent on 2/25/22.
// Tested by Afiya Vora on 6/20/22.
// Modified by Afiya Vora on 6/28/22.
// Tested by Zohair Ali Khan on 6/28/22.
// Modified by Zohair Ali Khan on 6/28/2022.

import SwiftUI
import Foundation
import UIKit


struct ContentView: View {
    
    @StateObject private var drinkListVM = DrinkListViewModel()
    @StateObject private var ingredientListVM = IngredientListViewModel()
 //   @StateObject private var drinkListMaster = DrinkListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer().frame(height: 44.0)
                    
                        HStack {
                            Image("Good Sips Icons - words") // good sips icon
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 40, alignment: .center)
                        }
                        Spacer()
                        }
                        .edgesIgnoringSafeArea(.top)
                        .background()
                VStack {
                    Spacer()
                    .background()
                        HStack {
                            Spacer()
                            
                                NavigationLink(destination: DrinkUIView(drinkListVM:drinkListVM)){ // Search Name Button
                                    Text("Search Cocktails")
                                        .frame(width: 150, height: 150)
                                        .background(Color(red: 116/255, green: 149/255, blue: 154/255))
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.white)
                                        .cornerRadius(10)
                                }
                            Spacer()
                            
                                NavigationLink(destination: IngredientSearch(ingredientListVM:ingredientListVM)){ // Search by ingreident
                                        Text("Search Ingredients")
                                            .frame(width: 150, height: 150)
                                            .background(Color(red: 116/255, green: 149/255, blue: 154/255))
                                            .font(.system(size: 25))
                                            .foregroundColor(Color.white)
                                            .cornerRadius(10)
                                }
                            Spacer()
                        }
                        Spacer()
                    
                                NavigationLink(destination: MasterList(drinkListVM:drinkListVM)){ // MasterList
                                    Text("COCKTAIL MASTER LIST")
                                        .frame(width: 340, height: 90)
                                        .background(Color(red: 116/255, green: 149/255, blue: 154/255))
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.white)
                                        .cornerRadius(10)
                                }
                        Spacer()
                    
                                NavigationLink(destination: Roulette(drinkListVM:drinkListVM)){ // Roulette
                                    Text("ROULETTE")
                                        .frame(width: 340, height: 90)
                                        .background(Color(red: 116/255, green: 149/255, blue: 154/255))
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.white)
                                        .cornerRadius(10)
                            }
                        Spacer()
                    
                                NavigationLink(destination: Featured(drinkListVM:drinkListVM)){ // Featured
                                    Text("FEATURED")
                                        .frame(width: 340, height: 90)
                                        .background(Color(red: 116/255, green: 149/255, blue: 154/255))
                                        .font(.system(size: 25))
                                        .foregroundColor(Color.white)
                                        .cornerRadius(10)
                            }
                        Spacer()
                        Group{
                            // Stress test conducted by Zohair Khan
                            // Managed to implement a link and with the help of Afiya, we created a button for it as well
                            // The button when tapped directly takes the user to the Safari on the iPhone and opens up
                            // Facebook successfully. I managed to successfully log in my Facebook as well.
                            Link("SHARE THE SIP", destination: URL(string: "https://www.facebook.com")!)
                                    .frame(width: 340, height: 90)
                                    .background(Color(red: 116/255, green: 149/255, blue: 154/255))
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10)
                        Spacer()
                    }
                       
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
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

