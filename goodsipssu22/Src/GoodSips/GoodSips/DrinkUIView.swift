//
// DrinkUIView.swift
// Good Sips
//
// DrinkUIView : Produces List of filtered drinks
// Accessed from : MasterList
// Accesses : DrinkProfile
//
// Created by Katelin Vincent, Jordan Finney on 4/2/22.
// Tested by Afiya Vora on 6/20/22.

import SwiftUI

struct DrinkUIView: View {
    @ObservedObject var drinkListVM :DrinkListViewModel
    var body: some View {
        ZStack(alignment: .top){
            
            VStack(alignment: .center, spacing: 0){ // Good sips logo
                
                HStack {
                    Spacer()
                    Image("Good Sips Icons - words") // good sips icon at top
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 40, alignment: .center)
                    Spacer()
                }
                Divider()
                
                VStack{ // Printing List of drinks complying with search text
                    Spacer()
                    List(drinkListVM.drinks, id: \.strDrink) {drink in
                        NavigationLink(destination: DrinkProfile(drinkListVM:drink)){
                            Text(drink.strDrink)
                        }
                    }.listStyle(.plain)
                        .searchable(text: $drinkListVM.searchName)
                        .onChange(of: drinkListVM.searchName){ value in
                            Task {
                                if value.count > 0 {
                                        await drinkListVM.search(name: value)
                                    }
                                }
                            }
                        }
                }
            }
        }
    }
    

struct DrinkUIView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkUIView(drinkListVM: .init())
    }
}
