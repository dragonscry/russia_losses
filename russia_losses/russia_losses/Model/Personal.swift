//
//  Personal.swift
//  russia_losses
//
//  Created by Denys on 01.07.2022.
//

import Foundation

struct PersonalModel: Codable, Hashable, Identifiable {
    let id = UUID()
    let date: String
    let day, personnel: Int
    let personnel_: String
    let pow: Int
    
    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case personnel_ = "personnel*"
        case pow = "POW"
    }
}
