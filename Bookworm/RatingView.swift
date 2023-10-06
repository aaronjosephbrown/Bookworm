//
//  RatingView.swift
//  Bookworm
//
//  Created by Aaron Brown on 10/6/23.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maxRating = 5
    
    var offImage: Image?
    var onImage: Image = Image(systemName: "star.fill" )
    
    var offColor: Color = .gray
    var onColor: Color = .yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maxRating + 1, id: \.self) { num in
                image(for: num)
                    .foregroundColor(num > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = num
                    }
            }
        }
    }
    
    func image(for num: Int) -> Image {
        if num > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}

