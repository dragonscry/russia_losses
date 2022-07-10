//
//  ContentView.swift
//  russia_losses
//
//  Created by Denys on 01.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = DownloadViemModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.equipments) { eq in
                    let person = connectLosses(equipment: eq)
                    NavigationLink {
                        DetailLosses(equipment: eq, personal: person)
                    } label: {
                        RowLosses(equipment: eq, person: person)
                    }

                }
            }
            .navigationTitle("Russian Losses:")
        }
    }
    
    func connectLosses(equipment: EquipmentModel) -> PersonalModel? {
        guard let person = vm.personal.first(where: { person in
            person.date == equipment.date
        }) else {return nil}
        return person
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
