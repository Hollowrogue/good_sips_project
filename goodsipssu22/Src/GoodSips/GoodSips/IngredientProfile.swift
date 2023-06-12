//
//  IngredientProfile.swift
//  Good Sips
//
// IngredientProfile : Displays Ingredient information
// Accessed from : Contentiew, IngredientListViewModel
//
//  Created by Katelin Vincent on 6/26/22.
//

import SwiftUI

struct IngredientProfile: View {
    
    @ObservedObject var ingredientListVM :IngredientViewModel
    @StateObject var taskStore = TaskStore()
    
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
                Spacer()
                    VStack {
                        
                        Spacer().frame(height: 16.0) // Creates Space between divider and profile text
                        
                        HStack {
                            
                            Spacer().frame(width: 16.0) // Space between profile text and left edge
                            
                            VStack(alignment: .leading){ // Stacking Name, Description, ID, ABV, and alcohol
                                
                                HStack{
                                    Text(ingredientListVM.ingredient.strIngredient)
                                        .bold()
                                        .font(.system(size:32))
                                }
                                Divider()
                                HStack{
                                    Text("Description : ")
                                        .bold()
                                        .font(.system(size: 16))
                                    Spacer()
                                }
                                Text(ingredientListVM.ingredient.strDescription)
                                        .font(.system(size: 16))
                                HStack{
                                    Text("ID : ")
                                        .bold()
                                        .font(.system(size: 16))
                                    Text(ingredientListVM.ingredient.idIngredient)
                                            .font(.system(size: 16))
                                    Spacer()
                                }
                                HStack{
                                    Text("Alcoholic :")
                                        .bold()
                                        .font(.system(size: 16))
                                    Text(ingredientListVM.ingredient.strAlcohol)
                                            .font(.system(size: 16))
                                    Spacer()
                                }
                                HStack{
                                    Text("Type : ")
                                        .bold()
                                        .font(.system(size: 16))
                                    Text(ingredientListVM.ingredient.strType)
                                            .font(.system(size: 16))
                                    Spacer()
                                }
                                HStack{
                                    Text("Alcohol By Volume : ")
                                        .bold()
                                        .font(.system(size: 16))
                                    Text(ingredientListVM.ingredient.strABV) 
                                            .font(.system(size: 16))
                                    Spacer()
                                }
                                Spacer()


                            }
                        }          }
            }
        }
    }
}

struct IngredientProfile_Previews: PreviewProvider {
    static var previews: some View {
        IngredientProfile(ingredientListVM: .init(ingredient: .sample))
    }
}
