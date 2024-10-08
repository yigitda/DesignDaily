//
//  ProductDetailView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct ProductDetailView: View {
    var productName: String = "Barcelona Chair"
    var productDetails: String = """
    Designers: Mies van der Rohe and Lilly Reich
    Date: 1929
    Style: Modernism
    Size: 75x75x75 cm
    Materials: Chrome on steel, frame. Leather...
    """
    var productDescription: String = """
    The Barcelona chair is a chair designed by Ludwig Mies van der Rohe and Lilly Reich, for the German Pavilion at the International Exposition of 1929, hosted by Barcelona, Catalonia, Spain. The chair was first used in Villa Tugendhat, a private residence, designed by Mies in Brno...
    """

    var body: some View {
        VStack(spacing: 20) {
            // Navigation Bar
            HStack {
                Text("DesignDaily")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "line.horizontal.3")
            }
            .padding()
            
            // Product Image and Details
            Image("barcelona-chair") // Replace with your asset name
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(productName)
                    .font(.title2)
                    .bold()
                
                Text(productDetails)
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text(productDescription)
                    .font(.body)
            }
            .padding()

            Spacer()

            // Bottom Navigation
            BottomNavigationView()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

