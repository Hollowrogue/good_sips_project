//
// IngredientSearch.swift
// Good Sips
//
// Ingredient : produces ingredient list in compliance with search term 
// Connected To : ContentView, Ingredient, ingredientrofile
//
// Created by Katelin Vincent on 6/26/22.
//

import SwiftUI

struct IngredientSearch: View {
    @ObservedObject var ingredientListVM :IngredientListViewModel
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
                    VStack{
                        Spacer()
                        List(ingredientListVM.ingredients, id: \.strIngredient) {ingredient in
                            NavigationLink(destination: IngredientProfile(ingredientListVM:ingredient)){
                                Text(ingredient.strIngredient)
                            }
                        }.listStyle(.plain)
                            .searchable(text: $ingredientListVM.searchIngredient, prompt: "Search for Ingredients")
                            .onChange(of: ingredientListVM.searchIngredient){ value in
                                Task {
                                    if value.count > 0 {
                                            await ingredientListVM.searchIngredient(ingredient: value)
                                    }
                                    
                                }
                    }
                }
            }
        }
    }
}
    

struct IngredientSearch_Previews: PreviewProvider {
    static var previews: some View {
        IngredientSearch(ingredientListVM: .init())
    }
}
