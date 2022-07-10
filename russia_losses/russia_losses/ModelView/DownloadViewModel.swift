//
//  DownloadViewModel.swift
//  russia_losses
//
//  Created by Denys on 01.07.2022.
//

import Foundation
import SwiftUI

class DownloadViemModel: ObservableObject {
    
    @Published var equipments: [EquipmentModel] = []
    @Published var personal: [PersonalModel] = []
    
    init() {
        
        //MARK: Data from url
        //uncomment to download data from url
//        API.shared.getParsedData(fromURL: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json") { array in
//            self.equipments = array
//        }
//        
//        API.shared.getParsedData(fromURL: "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json") { array in
//            self.personal = array
//        }
        
        //MARK: Data from local json file
        //uncomment to download data from local json file
        DataFromLocalJSON.shared.loadData(fromm: DataFromLocalJSON.losses_equipment) { array in
            self.equipments = array
        }
        
        DataFromLocalJSON.shared.loadData(fromm: DataFromLocalJSON.losses_personnel) { array in
            self.personal = array
        }
        
    }
}
