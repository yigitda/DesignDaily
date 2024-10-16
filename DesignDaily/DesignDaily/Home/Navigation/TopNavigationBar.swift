//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//


import SwiftUI

struct TopNavigationBar: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Button(action: {
                // Hamburger menu action
            }) {
                Image(systemName: "line.horizontal.3")
            }
        }
        .padding()
        .background(Color.black)
    }
}
