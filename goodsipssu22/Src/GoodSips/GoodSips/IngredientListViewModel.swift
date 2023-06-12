//
// IngredientListViewModel.swift
// Good Sips
//
// IngredientListViewModel : Creating ingredient list structure
// Connected To : Webservice, Ingredient
//
// Created by Katelin Vincent 6/26/22.
// 

import Foundation
import SwiftUI

class IngredientListViewModel: ObservableObject{

    @Published var ingredients: [IngredientViewModel] = []
    @Published var searchIngredient: String = ""
    init(){

        Task(priority: .userInitiated){
            print(#function + ":: init :: task")
            await searchIngredient(ingredient: searchIngredient)
        }
    }
    func searchIngredient(ingredient: String) async{
        print(#function)
        do{
        let drinks = try await Webservice().getDrinksIngredients(searchTerm: ingredient)
            DispatchQueue.main.async {
               
                self.ingredients = drinks.map{drink in
                    return IngredientViewModel(ingredient: Ingredient(idIngredient: drink.idIngredient, strIngredient: drink.strIngredient, strDescription: drink.strDescription, strType: drink.strType, strAlcohol: drink.strType, strABV: drink.strABV))
                }
            }
        } catch {
            print("\(#function) \(error)")
        }
    }
}


class IngredientViewModel : ObservableObject{
    let ingredient: Ingredient
    init(ingredient:Ingredient){
        self.ingredient = ingredient
    }
    var idIngredient: String {
        ingredient.idIngredient
    }
    var strIngredient: String {
        ingredient.strIngredient
    }
    var strDescription: String {
        ingredient.strDescription
    }
    var strAlcohol: String {
        ingredient.strAlcohol
    }
    var strType: String {
        ingredient.strType
    }
    var strABV: String {
        ingredient.strABV
    }


}
