//
//  Personal.swift
//  russia_losses
//
//  Created by Denys on 01.07.2022.
//

import Foundation

//{
//    "date": "2022-02-25",
//    "day": 2,
//    "personnel": 2800,
//    "personnel*": "about",
//    "POW": 0
//}

struct PersonalModel: Codable {
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
