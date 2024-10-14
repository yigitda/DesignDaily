//
//  Untitled.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

class ProfileEditViewModel: ObservableObject {
    // Properties
    @Published var userName: String = "Anna Smith"
    @Published var biography: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    @Published var contactInfo: String = "smith-john@gmail.com\n+21 567 839 3478\nNevoyak street, Haga, No:2"
    @Published var lists: [String] = ["Lightings"]
    @Published var profileImage: String = "anna-smith" // Image name from assets
    
    // Method to update biography
    func updateBiography(newBiography: String) {
        // Here you could validate and update the biography, for now, it just assigns
        biography = newBiography
    }
    
    // Method to update contact information
    func updateContact(newContact: String) {
        contactInfo = newContact
    }
    
    // Method to add new list item
    func addListItem(newItem: String) {
        lists.append(newItem)
    }
    
    // Method to update profile picture
    func updateProfileImage(imageName: String) {
        profileImage = imageName
    }
}
