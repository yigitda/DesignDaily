//
//  BottomNavigationView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct BottomNavigationView: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "house.fill")
            Spacer()
            Image(systemName: "magnifyingglass")
            Spacer()
            Image(systemName: "heart")
            Spacer()
            Image(systemName: "person.crop.circle")
            Spacer()
        }
        .padding()
        .background(Color.black)
        .foregroundColor(.white)
    }
}


