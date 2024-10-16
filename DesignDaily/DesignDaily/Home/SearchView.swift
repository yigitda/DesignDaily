//
//  SearchView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @State private var activeFilters: [String] = ["eclectic", "age", "cat", "dog"]
    let categories = ["Modernism", "Maximalism", "Minimalism", "Bauhaus", "Art Nouveau", "De Stijl"]

    var body: some View {
        VStack(spacing: 0) {

            TopNavigationBar(title: "DesignDaily")
                .background(Color.black)
                .foregroundColor(.white)


            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(activeFilters, id: \.self) { filter in
                        HStack {
                            Text(filter)
                                .foregroundColor(.white)
                            Button(action: {

                                activeFilters.removeAll { $0 == filter }
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.gray)
                        .cornerRadius(20)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
            .background(Color.gray)


            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 16) {
                    ForEach(categories, id: \.self) { category in
                        VStack {
                            Image(category.lowercased())
                                .resizable()
                                .scaledToFill()
                                .frame(height: 100)
                                .clipped()
                            Text(category)
                                .font(.headline)
                                .padding(.top, 8)
                        }
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 2)
                        .onTapGesture {

                        }
                    }
                }
                .padding()
            }

        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}
