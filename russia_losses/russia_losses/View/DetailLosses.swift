//
//  DetailLosses.swift
//  russia_losses
//
//  Created by Denys on 03.07.2022.
//

import SwiftUI

struct DetailLosses: View {
    
    let equipment: EquipmentModel
    let personal: PersonalModel?
    
    var body: some View {
        VStack(alignment: .leading) {
            //header
            
            HStack {
                if let person = personal {
                    Image(systemName: "person.3.fill")
                    Text(": \(person.personnel_) \(person.personnel)")
                }
            }
            .font(.system(size: 30))
            
            Group {
                Text("Aircraft: \(equipment.aircraft)")
                Text("Helicopter: \(equipment.helicopter)")
                Text("Tanks: \(equipment.tank)")
                Text("APC: \(equipment.apc)")
                Text("Field Artillery: \(equipment.fieldArtillery)")
                Text("MRL: \(equipment.mrl)")
                Text("Drone: \(equipment.drone)")
                Text("Naval Ship: \(equipment.navalShip)")
                Text("Anti-Aircraft Warfate: \(equipment.antiAircraftWarfare)")
                
            }
            
            Group {
                Text("Special Equipment: \(equipment.specialEquipment != nil ? equipment.specialEquipment!.description : "No Data")")
                Text("Vehicles and Fuel Tanks: \(equipment.vehiclesAndFuelTanks != nil ? equipment.vehiclesAndFuelTanks!.description : "No Data")")
                Text("Cruise Missiles: \(equipment.cruiseMissiles != nil ? equipment.cruiseMissiles!.description : "No Data")")
                Text("Military Auto: \(equipment.militaryAuto)")
                Text("Fuel Tank: \(equipment.fuelTank)")
                Text("Mobile SRBM System: \(equipment.mobileSRBMSystem != nil ? equipment.mobileSRBMSystem!.description : "No Data")")
            }
            

            
            
            Spacer()
        }
        .navigationTitle("DAY: \(equipment.day.description) OF INVASION")
        .padding(.horizontal,20)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(RoundedRectangle(cornerRadius: 30, style: .continuous).foregroundColor(.white).shadow(radius: 20))
        .padding()
        
    }
}

struct DetailLosses_Previews: PreviewProvider {
    
    static let person: PersonalModel = PersonalModel(date: "2222", day: 2, personnel: 2000, personnel_: "about", pow: 230)
    static let equipment: EquipmentModel = EquipmentModel(date: "2025-02-24", day: Day.string("2"), aircraft: 10, helicopter: 23, tank: 34, apc: 21, fieldArtillery: 32, mrl: 23, drone: 43, navalShip: 23, antiAircraftWarfare: 23, specialEquipment: 24, vehiclesAndFuelTanks: 42, cruiseMissiles: 35, militaryAuto: 65, fuelTank: 74, mobileSRBMSystem: 64)
    
    static var previews: some View {
        DetailLosses(equipment: equipment, personal: person)
    }
}
