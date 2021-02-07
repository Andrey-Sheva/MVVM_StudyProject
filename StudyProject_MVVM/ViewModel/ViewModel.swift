//
//  ViewModel.swift
//  MVVM_StudyProject_1
//
//  Created by Андрей Шевчук on 07.02.2021.
//

import UIKit

struct PersonViewModel {
    let name: String
    let userName: String
    var currentlyFollowing: Bool
    let image: UIImage?
    
    init(with model: Person) {
        self.name = model.name ?? ""
        self.userName = model.userName
        self.currentlyFollowing = false
        self.image = UIImage(systemName: "person")
    }
}
