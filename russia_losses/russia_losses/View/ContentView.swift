//
//  ContentView.swift
//  russia_losses
//
//  Created by Denys on 01.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = DownloadViemModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(vm.equipments) { eq in
                        Text("Date of war \(eq.date)")
                        Text("Day of war \(eq.day.description)")
                    }
                }
            }
            .navigationTitle("Russian Losses:")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
