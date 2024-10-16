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
    @Published var profileImage: String = "anna-smith"
    

    func updateBiography(newBiography: String) {

        biography = newBiography
    }
    

    func updateContact(newContact: String) {
        contactInfo = newContact
    }
    

    func addListItem(newItem: String) {
        lists.append(newItem)
    }
    

    func updateProfileImage(imageName: String) {
        profileImage = imageName
    }
}
