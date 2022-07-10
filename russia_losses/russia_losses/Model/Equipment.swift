//
//  Equipment.swift
//  russia_losses
//
//  Created by Denys on 01.07.2022.
//

import Foundation

struct EquipmentModel: Codable, Hashable, Identifiable {
    
    static func == (lhs: EquipmentModel, rhs: EquipmentModel) -> Bool {
        lhs.date < rhs.date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id = UUID()
    let date: String
    let day: Day
    let aircraft, helicopter, tank, apc: Int
    let fieldArtillery, mrl: Int
    let drone, navalShip, antiAircraftWarfare: Int
    let specialEquipment, vehiclesAndFuelTanks, cruiseMissiles: Int?
    let militaryAuto, fuelTank: Int
    let mobileSRBMSystem: Int?
    
    enum CodingKeys: String, CodingKey {
        case day
        case date, aircraft, helicopter, tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
}

//custom structure because day in json file could be string or ing
enum Day: Codable, CustomStringConvertible {
    
    var description: String {
        switch self {
        case .integer(let x):
            return String(x)
        case .string(let x):
            return x
        }
    }
    
    case integer(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Day.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Day"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}
