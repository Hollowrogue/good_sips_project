//
// Ingredient.swift
// Good Sips
//
// Ingredient : creates ingredient structure to be accessed throughout program
// Connected To : IngredientListViewModel, Webservice
//
// Created by Katelin Vincent on 6/26/22.
//

import Foundation

struct IngredientResponse: Decodable {
    let ingredients: [Ingredient]

}

struct Ingredient: Decodable{  // Ingredient Structure
    let idIngredient : String
    let strIngredient: String
    let strDescription: String
    let strType: String
    let strAlcohol: String
    let strABV: String
    
    static let sample: Ingredient = .init(idIngredient: "test", strIngredient: "test", strDescription: "test", strType: "test", strAlcohol: "test", strABV: "test")

}
