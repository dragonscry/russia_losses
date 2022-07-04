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
            
            Text("Aircraft: \(equipment.aircraft)")
            Text("Helicopter: \(equipment.helicopter)")
            Text("Tanks: \(equipment.tank)")
            
            
            Spacer()
        }
        .navigationTitle("DAY: \(equipment.day.description) OF INVASION")
        .padding(.horizontal,20)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(RoundedRectangle(cornerRadius: 30, style: .continuous).foregroundColor(.white).shadow(radius: 20))
        .padding()
        
    }
    
    var header: some View {
        VStack {
            HStack {
                Text("DAY")
                    .font(.system(size:110))
                Spacer()
                Text("\(equipment.day.description)")
                    .font(.system(size:110))
            }
            HStack {
                Text("OF")
                    .font(.system(size: 90))
                Spacer()
                VStack {
                    Text("RUSSIAN")
                        .font(.system(size: 40))
                    Text("INVASION")
                        .font(.system(size: 35))
                }
                
            }
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
