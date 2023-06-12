//
// RatingView.swift
// Good Sips
//
// RatingView : Displays 5 Star Rating
// Accessed from : BarTabList, My Sips
// Accesses: DataStore
//
// Created by Mason Greenwell on 4/11/22.
// Tested by Afiya Vora on 6/20/22.

import Foundation
import SwiftUI



struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maxRating = 5
    
    var offImage: Image? // Creating off Image
    var onImage = Image(systemName: "star.fill") // Creating on Image
    
    var offColor = Color.gray // Color when star is not in rating
    var onColor = Color.blue // Color when star is in rating
    
    
    var body: some View {
        
        HStack{
            if label.isEmpty == false{
                Text(label)
            }
            
            ForEach(1..<maxRating + 1, id: \.self) { // Changes star color
                number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image { // Prints stars
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
        
    }
}
