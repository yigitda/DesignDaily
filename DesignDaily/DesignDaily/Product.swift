//
//  Product.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id: UUID
    let name: String
    let imageName: String
    let designerNames: String
    let date: String
    let style: String
    let size: String
    let materials: String
    let description: String
}
