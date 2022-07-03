//
//  LossesRow.swift
//  russia_losses
//
//  Created by Denys on 03.07.2022.
//

import SwiftUI

struct RowLosses: View {
    
    let equipment: EquipmentModel
    let person: PersonalModel?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Day: \(equipment.day.description)")
                    .font(.title)
                if let person = person {
                    Text("Russia lost: \(person.personnel) people")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
    }
}

struct LossesRow_Previews: PreviewProvider {
    
    static let person: PersonalModel = PersonalModel(date: "2222", day: 2, personnel: 2000, personnel_: "about", pow: 230)
    static let equipment: EquipmentModel = EquipmentModel(date: "2025-02-24", day: Day.string("2"), aircraft: 10, helicopter: 23, tank: 34, apc: 21, fieldArtillery: 32, mrl: 23, drone: 43, navalShip: 23, antiAircraftWarfare: 23, specialEquipment: 24, vehiclesAndFuelTanks: 42, cruiseMissiles: 35, militaryAuto: 65, fuelTank: 74, mobileSRBMSystem: 64)
    
    static var previews: some View {
        RowLosses(equipment: equipment, person: person)
            .previewLayout(.sizeThatFits)
    }
}
