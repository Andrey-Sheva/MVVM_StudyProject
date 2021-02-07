//
//  Model.swift
//  MVVM_StudyProject_1
//
//  Created by Андрей Шевчук on 07.02.2021.
//

import Foundation

enum Gender {
    case male
    case female
    case undefined
}

struct Person {
    let name: String?
    let birthday: Date?
    let secondName: String?
    let address: String?
    let gender: Gender
    let userName = "Andrew"
    
    init(name: String,
         birthday: Date? = nil,
         secondName: String? = nil,
         address: String? = nil,
         gender: Gender) {
        self.name = name
        self.birthday = birthday
        self.secondName = secondName
        self.address = address
        self.gender = gender
    }
}
