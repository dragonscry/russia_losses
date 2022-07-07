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
        VStack {
            VStack(alignment: .leading) {
                
                HStack {
                    if let person = personal {
                        Image(systemName: "person.3.fill")
                        Text(": \(person.personnel_) \(person.personnel)")
                    }
                }
                .foregroundColor(.red)
                
                .font(.system(size: 30, weight: .bold, design: .rounded))
                
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
                .font(.system(size: 25, weight: .medium, design: .rounded))
                
                Group {
                    
                    if let specEquip = equipment.specialEquipment {
                        Text("Special Equipment: \(specEquip)")
                    }
                    
                    if let vehiclesFTanks = equipment.vehiclesAndFuelTanks {
                        Text("Vehicles and Fuel Tanks: \(vehiclesFTanks)")
                    }
                    
                    if let cruiseMissiles = equipment.cruiseMissiles {
                        Text("Cruise Missiles: \(cruiseMissiles)")
                    }
                    
                    if equipment.militaryAuto > 0 {
                        Text("Military Auto: \(equipment.militaryAuto)")
                    }
                    if equipment.fuelTank > 0 {
                        Text("Fuel Tank: \(equipment.fuelTank)")
                    }
                    
                    if let mobSRBM = equipment.mobileSRBMSystem {
                        if mobSRBM > 0 {
                            Text("Mobile SRBM System: \(mobSRBM)")
                        }
                    }
                }
                .font(.system(size: 25, weight: .medium, design: .rounded))
            }
            .navigationTitle("DAY: \(equipment.day.description) OF INVASION")
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(RoundedRectangle(cornerRadius: 30, style: .continuous).foregroundColor(.white).shadow(radius: 20))
            .padding()
            
            Spacer()
        }
        
    }
}

struct DetailLosses_Previews: PreviewProvider {
    
    static let person: PersonalModel = PersonalModel(date: "2222", day: 2, personnel: 2000, personnel_: "about", pow: 230)
    static let equipment: EquipmentModel = EquipmentModel(date: "2025-02-24", day: Day.string("2"), aircraft: 10, helicopter: 23, tank: 34, apc: 21, fieldArtillery: 32, mrl: 23, drone: 43, navalShip: 23, antiAircraftWarfare: 23, specialEquipment: 24, vehiclesAndFuelTanks: 42, cruiseMissiles: 35, militaryAuto: 65, fuelTank: 74, mobileSRBMSystem: 64)
    
    static var previews: some View {
        DetailLosses(equipment: equipment, personal: person)
    }
}
