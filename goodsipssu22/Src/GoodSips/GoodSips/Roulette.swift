//
// Roulette.swift
// Good Sips
//
// Roulette : Prints Random Drink Profile
// Accessed from : ContentView
// Accesses : BarTab
//
// Created by Katelin Vincent on 2/28/22.
// Tested by Afiya Vora on 6/20/22.

import SwiftUI

struct Roulette: View {
    @ObservedObject var drinkListVM : DrinkListViewModel

    var body: some View {
        ZStack {

                VStack {
                    DrinkProfile(drinkListVM:drinkListVM.drinks.randomElement()!)
                    }
                    .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Roulette_Previews: PreviewProvider {
    static var previews: some View {
        Roulette(drinkListVM: .init())
    }
}
