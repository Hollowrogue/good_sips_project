//
// Featured.swift
// Good Sips
//
// Featured : Creates featured list of randomized drinks
// Accessed from : ContentView
// Accesses : BarTab
//
// Created by Katelin Vincent on 2/28/22.
// Tested by Afiya Vora on 6/20/22.

import SwiftUI

struct Featured: View {
    
    @ObservedObject var drinkListVM : DrinkListViewModel
    
    var body: some View {
        ZStack(alignment: .top){
            
            VStack(alignment: .center, spacing: 0){ // Good sips logo/bar photo/navigation buttons
                
                HStack {
                    Spacer()
                    Image("Good Sips Icons - words") // good sips icon at top
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 40, alignment: .center)
                    Spacer()
                }
                
                Divider()
                
                List {
                    NavigationLink(destination: DrinkProfile(drinkListVM:drinkListVM.drinks.randomElement()!)){
                        Text("A Morning Mix")
                    }
                    NavigationLink(destination: DrinkProfile(drinkListVM:drinkListVM.drinks.randomElement()!)){
                        Text("A Drink to End the Day")
                    }
                    NavigationLink(destination: DrinkProfile(drinkListVM:drinkListVM.drinks.randomElement()!)){
                        Text("A New Experience")
                    }
                    NavigationLink(destination: DrinkProfile(drinkListVM:drinkListVM.drinks.randomElement()!)){
                        Text("A Drink to Try with a Friend")
                    }
                    NavigationLink(destination: DrinkProfile(drinkListVM:drinkListVM.drinks.randomElement()!)){
                        Text("Doyou like to Gamble?")
                    }
                }.listStyle(.plain)
                Spacer()
            }
        }
    }
}

struct Featured_Previews: PreviewProvider {
    static var previews: some View {
        Featured(drinkListVM: .init())
    }
}
