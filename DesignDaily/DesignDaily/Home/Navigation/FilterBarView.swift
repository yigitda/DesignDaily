//
//  FilterBarView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 14.10.2024.
//

// FilterBarView.swift

import SwiftUI

struct FilterBarView: View {
    var filters: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.self) { filter in
                    HStack(spacing: 5) {
                        Text(filter)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(20)
                        Button(action: {
                            // Remove filter action
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
