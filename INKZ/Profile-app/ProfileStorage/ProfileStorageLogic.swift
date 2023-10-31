//
//  ProfileStorageLogic.swift
//  Profile-app
//
//  Created by Stanislava Shestakova on 04/10/2023.
//

import Foundation

protocol ProfileStorageLogic {
    func save(_ profile: ProfileModel)
    func read() -> ProfileModel
}
