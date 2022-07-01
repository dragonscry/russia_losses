//
//  ContentView.swift
//  russia_losses
//
//  Created by Denys on 01.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = DownloadViemModel()
    
    var body: some View {
        List {
            ForEach(vm.equipments, id: \.self) { equipment in
                VStack{
                    Text("title is: \(equipment.date)")
                    //Text("date: \(equipment.date)")
                    //Text("day is: \(equipment.day)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
