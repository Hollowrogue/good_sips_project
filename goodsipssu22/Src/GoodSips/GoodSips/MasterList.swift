//
// MasterList.swift
// Good Sips
//
// MasterList : Displays List of Drinks
// Accessed from : ContentView
// Accesses : DrinkProfile
//
// Created by Katelin Vincent on 2/28/22.
// Tested by Afiya Vora on 6/20/22.

import SwiftUI

// router function

struct MasterList: View {
    
    @State private var Stext: String = ""
    @ObservedObject var drinkListVM:DrinkListViewModel
    
    var body: some View {
        ZStack(alignment: .top){
            VStack(alignment: .center, spacing: 0){ // Good sips logo/bar photo/navigation buttons
                HStack {
                    Image("Good Sips Icons - words") // good sips icon at top
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 40, alignment: .center)
                }
                Divider()
                
                VStack{ // Stacking drinks
                    List { // Printing list of drinks from drinkListVM
                        ForEach(drinkListVM.drinks, id: \.strDrink){ drink in
                            NavigationLink(destination: DrinkProfile(drinkListVM:drink)){
                                Text(drink.strDrink)
                            }
                            }.listStyle(.plain)
                    }
                }
            }
        }
    }
}


struct MasterList_Previews: PreviewProvider {
    static var previews: some View {
        MasterList(drinkListVM: .init())
    }
}

    
