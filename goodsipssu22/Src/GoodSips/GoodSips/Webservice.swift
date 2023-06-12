
// Webservice.swift
// Good Sips
//
// Webervice : Accesses API
// Connected To : Drink, DrinkUIView, API: https://www.thecocktaildb.com
//
// Created by Katelin Vincent, Jordan Finney on 4/2/22.
// Tested by Afiya Vora on 6/20/22.
// Tested by Zohair Khan on 6/20/22

import Foundation
import UIKit

enum NetworkError: Error {
    case badURL
    case badID
}

class Webservice {
    
    func getDrinks(searchTerm: String) async throws -> [Drink]{ // search by name
        var components = URLComponents()
        components.host = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
        
        guard let url = components.url else {
            throw NetworkError.badURL
        }
        let (data, response) = try await URLSession.shared.data(from:URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(searchTerm)")!)
            let DrinkResponse = try JSONDecoder().decode(DrinkResponse.self, from: data)
        return DrinkResponse.drinks ?? []
    }
    
    func getDrinksIngredients(searchTerm: String) async throws -> [Ingredient]{ // search by ingredient
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.thecocktaildb.com"
        components.path = "/api/json/v1/1/search.php"
        components.queryItems = [
            .init(name: "i", value: searchTerm)]
       

        guard let url = components.url else {
            throw NetworkError.badURL
        }
        let (data, response) = try await URLSession.shared.data(from:url)
        print(String(data: data, encoding: String.Encoding.utf8))
            let ingredientResponse = try JSONDecoder().decode(IngredientResponse.self, from: data)
        return ingredientResponse.ingredients ?? []
    }
}

